package com.mychu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.BufferedReader;
import java.io.InputStreamReader;

@Controller
public class PythonScriptController {

    @PostMapping("/run-python-script")
    public String runPythonScript(@RequestParam("variable1") String variable1,
                                  @RequestParam("variable2") String variable2,
                                  Model model) {
        try {
            // 파이썬 파일 경로 (바탕화면에 있는 파이썬 파일)
            String pythonScriptPath = "C:/Users/username/Desktop/script.py";

            // 파이썬 스크립트를 실행할 때 인자로 전달
            ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScriptPath, variable1, variable2);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();

            // 파이썬 스크립트의 출력을 읽기
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            StringBuilder output = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
            }
            model.addAttribute("scriptOutput", output.toString());
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("scriptOutput", "Error executing Python script: " + e.getMessage());
        }

        return "result";
    }
}
