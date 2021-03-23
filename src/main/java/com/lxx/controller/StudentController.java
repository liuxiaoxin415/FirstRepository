package com.lxx.controller;

import com.lxx.pojo.Student;
import com.lxx.service.StudentService;
import com.lxx.util.ExcelUtils;
import com.lxx.util.PageUtil;
import com.sun.deploy.net.HttpResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {

    @Autowired
    StudentService studentService;

    @RequestMapping("/student_list/{pageIndex}/{pageSize}")
    public String getStudents(@PathVariable("pageIndex") int pageIndex, @PathVariable("pageSize") int pageSize,
                              @RequestParam(value = "name", defaultValue = "") String name, @RequestParam(value = "classID", defaultValue = "0") long classID,
                              Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageStart", (pageIndex - 1) * pageSize);
        map.put("pageSize", pageSize);
        map.put("name", "%" + name + "%");
        map.put("classID", classID);

        int totolCount = studentService.getTotolCount(map);
        List<Student> students = studentService.getStudents(map);

        PageUtil pageUtil = new PageUtil(pageIndex, pageSize, totolCount, students);
        model.addAttribute("pageUtil", pageUtil);

        return "studentlist";
    }

    @RequestMapping("/exportExcel")
    public void exportExcel(@RequestParam(value = "name", defaultValue = "") String name, @RequestParam(value = "classID", defaultValue = "0") long classID, HttpServletResponse response) {
        HSSFWorkbook wb;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", name);
        map.put("classID", classID);
        List<Student> excelStudents = studentService.getExcelStudents(map);
        System.out.println("要导出的学生");
        String[][] content = new String[excelStudents.size()][5];
        for (int i = 0; i < excelStudents.size(); i++) {
            Student student = excelStudents.get(i);
            content[i][0] = String.valueOf(student.getId());
            content[i][1] = String.valueOf(student.getName());
            content[i][2] = String.valueOf(student.getSex());
            content[i][3] = String.valueOf(student.getEmail());
            content[i][4] = String.valueOf(student.getPhone());
        }

        //需要把查询到的学生信息生成Excel，传到前端
        String[] title = {"序号", "姓名", "性别", "邮箱", "手机号"};
        //代生成的Excel文件
        wb = ExcelUtils.getHSSFWorkbook("学生信息统计", title, content);

        try {
            //excel文件名
            String fileName = "学生信息表" + System.currentTimeMillis() + ".xls";
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);//响应给客户端
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 发送响应流方法
     */
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes("ISO-8859-1"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO-8859-1");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
