package controller;

import domains.Admin;
import domains.Questions;
import domains.Student;
import jdk.nashorn.internal.ir.RuntimeNode;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by suman maharjan on 09/09/2016.
 */

public class UserServlet extends javax.servlet.http.HttpServlet {
    HttpSession session;
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String page = request.getParameter("page");
        session=request.getSession(true);
        if (page.equalsIgnoreCase("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username==null && password==null){
                request.setAttribute("message", "Please Fill the Empty Spaces");
                check_Session(request,response);
            }
            UserService userService = new UserService();
            Admin admin = userService.getAdmin(username, password);
            if (admin != null) {
                session.setAttribute("admin",admin);
                RequestDispatcher rd = request.getRequestDispatcher("Admin/home.jsp");
                rd.forward(request, response);
            } else {
                Student student=userService.getStudent(username,password);
                if (student!=null) {
                    int attempt=student.getAttempt();
                    if (attempt==1) {
                        session.setAttribute("student_name", username);
                        session.setAttribute("student_roll", password);
                        RequestDispatcher rd = request.getRequestDispatcher("Student/instructions.jsp");
                        rd.forward(request, response);
                    }else{
                        request.setAttribute("message", "You have no attempts left.");
                        check_Session(request,response);
                    }
                }else{
                    request.setAttribute("message", "Incorrect Credentials");
                    check_Session(request,response);
                }
            }
        }
        if (page.equalsIgnoreCase("update_admin")){
            int id=Integer.parseInt(request.getParameter("id"));
            UserService userService = new UserService();
            Admin adminById=userService.getAdminById(id);
            String new_username=request.getParameter("new_username");
            String old_password=request.getParameter("old_password");
            String new_password=request.getParameter("new_password");
            String confirm_password=request.getParameter("confirm_password");
            if (!adminById.getPassword().matches(old_password)){
                request.setAttribute("message", "Invalid Password");
                RequestDispatcher rd=request.getRequestDispatcher("Admin/edit_info.jsp");
                rd.forward(request,response);
            }else{
                if (!new_password.matches(confirm_password)){
                    request.setAttribute("message", "Password doesnot match");
                    RequestDispatcher rd=request.getRequestDispatcher("Admin/edit_info.jsp");
                    rd.forward(request,response);
                }else{
                    Admin admin=new Admin();
                    admin.setId(id);
                    admin.setName(new_username);
                    admin.setPassword(new_password);
                    userService.update_adminInfo(admin);
                    session.setAttribute("admin",admin);
                    request.setAttribute("message", "Password Changed Successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("Admin/edit_info.jsp");
                    rd.forward(request, response);
                }
            }
        }
        if (page.equalsIgnoreCase("add_student")){
            int number=Integer.parseInt(request.getParameter("numberOfStudent"));
            for (int i=0; i<number;i++){
                String name="name"+i;
                String roll="roll"+i;

                String studentName=request.getParameter(name);
                String studentRoll=request.getParameter(roll);

                Student student=new Student();
                student.setName(studentName);
                student.setRoll(studentRoll);
                new UserService().insert_Student(student);
            }
            List<Student> studentList=new ArrayList<Student>();
            studentList=new UserService().getStudentList();
            request.setAttribute("studentList", studentList);
            RequestDispatcher rd=request.getRequestDispatcher("Admin/view_result.jsp");
            rd.forward(request,response);
        }

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String page=request.getParameter("page");
        check_Session(request,response);
            if (page.equalsIgnoreCase("logout")) {
                request.getSession().invalidate();
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
              if (page.equalsIgnoreCase("attempt_exam")){
                  List<Questions> questionsList = new ArrayList<Questions>();
                  questionsList = new UserService().getQuestionsList("whole_paper");
                  //Collections.shuffle(questionsList);
                  request.setAttribute("sectionA", "Section A: English");
                  request.setAttribute("sectionB", "Section B: Mathematics");
                  request.setAttribute("sectionC", "Section C: Physics");
                  request.setAttribute("sectionD", "Section D: Chemistry");
                  request.setAttribute("sectionE", "Section E: IQ");
                  request.setAttribute("questionsList", questionsList);
                  RequestDispatcher rd = request.getRequestDispatcher("Student/home.jsp");
                  rd.forward(request, response);
              }
             if (page.equalsIgnoreCase("addStudent")){
                 RequestDispatcher rd = request.getRequestDispatcher("Admin/addStudent.jsp");
                 rd.forward(request, response);
              }

            if (page.equalsIgnoreCase("home")) {
                RequestDispatcher rd = request.getRequestDispatcher("Admin/home.jsp");
                rd.forward(request, response);
            }
            if (page.equalsIgnoreCase("view_paper")) {
                RequestDispatcher rd = request.getRequestDispatcher("Admin/view_paper.jsp");
                rd.forward(request, response);
            }
            if (page.equalsIgnoreCase("edit_info")){
                RequestDispatcher rd=request.getRequestDispatcher("Admin/edit_info.jsp");
                rd.forward(request,response);
            }
    }
    public void check_Session(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException,IOException{
        session=request.getSession(true);
        if (session.getAttribute("admin")==null && session.getAttribute("student_name")==null){
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }
}
