package com.lxx.controller;

import com.lxx.util.ResultMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 负责文件上传
 */
@Controller
public class UploadController {

    @ResponseBody
    @RequestMapping("/photoUpload")
    public ResultMessage upload(MultipartFile file, HttpSession session) throws IOException {
        String oldFileName = file.getOriginalFilename();
        //获取服务器中存储文件上传的路径
        String realPath = session.getServletContext().getRealPath("/media/upload");
        //截取原始文件名后缀
        String[] strings = oldFileName.split("\\.");
        //拼接文件名，防止同名文件被替换
        String randomFileName = UUID.randomUUID().toString() + "." + strings[strings.length - 1];
        //真实的地址
        realPath = realPath + "\\" + randomFileName;

//      System.out.println("包装后的文件名" + randomFileName);
//      System.out.println("realPath" + realPath);

        //实现文件上传
        file.transferTo(new File(realPath));

        ResultMessage message = new ResultMessage(200, randomFileName);
        return message;
    }
}
