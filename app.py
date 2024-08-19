
from flask import Flask,request 
from flask_cors import CORS 
import pymysql as ps
import cv2
import numpy as np
import matplotlib.pyplot as plt
import urllib

def read_image(url):
    url_response = urllib.request.urlopen(url)
    img_array = np.array(bytearray(url_response.read()), dtype="uint8")
    img = cv2.imdecode(img_array, -1)
    return img

def most_frequent_colors(image_path, num_colors=3):
    image = np.array(image_path)
    if image is None:
        print(f"Error: Unable to load image from path {image_path}")
        return None

    pixels = np.float32(image.reshape(-1, 3))

    criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 100, 0.2)
    k = num_colors + 1
    _, labels, palette = cv2.kmeans(pixels, k, None, criteria, 10, cv2.KMEANS_RANDOM_CENTERS)

    unique_labels, counts = np.unique(labels, return_counts=True)
    color_counts = dict(zip(unique_labels, counts))

    # Filter out white color
    white_color = np.array([255, 255, 255])
    filtered_colors = [
        (palette[idx], color_counts[idx])
        for idx in color_counts
        if not np.allclose(palette[idx], white_color, atol=10)
    ]

    sorted_colors = sorted(filtered_colors, key=lambda x: x[1], reverse=True)
    return [color[0] for color in sorted_colors[:num_colors]]

def create_gradient(colors, width=800, height=100):
    gradient = np.zeros((height, width, 3), dtype=np.uint8)

    num_colors = len(colors)
    segment_width = width // (num_colors - 1)

    for i in range(num_colors - 1):
        start_color = np.array(colors[i])
        end_color = np.array(colors[i + 1])

        for x in range(segment_width * i, segment_width * (i + 1)):
            t = (x - segment_width * i) / segment_width
            gradient[:, x, :] = (1 - t) * start_color + t * end_color

    gradient[:, segment_width * (num_colors - 1):, :] = colors[-1]

    return gradient

def feather_mask(mask, feather_amount=30):
    # Create a feathered version of the mask
    feathered_mask = np.zeros_like(mask, dtype=np.float32)
    kernel_size = feather_amount * 2 + 1
    feathered_mask = cv2.GaussianBlur(mask.astype(np.float32), (kernel_size, kernel_size), 0)
    return feathered_mask

def replace_color_with_gradient(overlay, chroma_key_color, gradient):
    overlay_height, overlay_width, _ = overlay.shape
    gradient_height, gradient_width, _ = gradient.shape

    if gradient_width < overlay_width or gradient_height < overlay_height:
        gradient = cv2.resize(gradient, (overlay_width, overlay_height), interpolation=cv2.INTER_LINEAR)

    # Create a mask for the chroma key color
    chroma_key_color = np.array(chroma_key_color)
    color_mask = np.all(np.abs(overlay[:, :, :3] - chroma_key_color) < 20, axis=-1)

    # Convert mask to float32 for processing
    mask = color_mask.astype(np.float32)
    feathered_mask = feather_mask(mask)

    # Apply gradient to the chroma key color regions
    result = overlay.copy()
    result[color_mask] = gradient[color_mask]

    # Blend the gradient and the original image using feathered mask
    result[:, :, :3] = np.uint8(result[:, :, :3] * (1 - feathered_mask[:, :, np.newaxis]) + gradient * feathered_mask[:, :, np.newaxis])

    return result

conn = ps.connect(host="project-db-cgi.smhrd.com", user="mymy", passwd="321", port=3307, db="mymy")
curs = conn.cursor()
app = Flask(__name__)
CORS(app)
overlay_path = 'C:/Users/smhrd/git/mymy/Mychu/src/main/resources/static/ticket/origin.jpg'
@app.route('/generator/<movie_index>')
def generate(movie_index):
    curs.execute(f"select movie_poster_url from movies where movie_idx={movie_index}")
    res = curs.fetchall()
    image_path = res[0][0]
    image = read_image(image_path)
    colors = most_frequent_colors(image)
    result_path = f'C:/Users/smhrd/git/mymy/Mychu/src/main/resources/static/ticket/final_image_{movie_index}.png'
   
    if colors:
        print("Most Frequent Colors (BGR):")
        for color in colors:
            print(color)
    
        gradient_image = create_gradient(colors)
    
        overlay = cv2.imread(overlay_path, cv2.IMREAD_UNCHANGED)
        if overlay is None:
            print(f"Error: Unable to load overlay image from path {overlay_path}")
        else:
            # Define the chroma key color (e.g., bright green)
            chroma_key_color = [0, 255, 0]  # BGR format for bright green
    
            final_image = replace_color_with_gradient(overlay, chroma_key_color, gradient_image)
    
            # Save the image using cv2
            cv2.imwrite(result_path, final_image)
    
            # Display the image using matplotlib
            final_image_rgb = cv2.cvtColor(final_image, cv2.COLOR_BGR2RGB)
            # plt.imshow(final_image_rgb)
            # plt.axis('off')
            # plt.show()
    else:
        print("Failed to extract the most frequent colors.")
    return result_path

if __name__ == "__main__":
    app.run(port=5000, use_reloader=False)