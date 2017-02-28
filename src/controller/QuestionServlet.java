package controller;

import com.sun.javafx.UnmodifiableArrayList;
import com.sun.javafx.collections.IntegerArraySyncer;
import domains.Admin;
import domains.Questions;
import domains.Student;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by suman maharjan on 16/09/2016.
 */
@WebServlet(name = "QuestionServlet")
public class QuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page=request.getParameter("page");

        new UserServlet().check_Session(request,response);
              if (page.equalsIgnoreCase("submit_paper")){
                  List<Questions> questionsList=new ArrayList<Questions>();
                  questionsList=new UserService().getQuestionsList("whole_paper");
                  String answers[]=new String[90];
                    for (int i=1; i<=questionsList.size(); i++) {
                        String answer="question"+i+"answer";
                        if (request.getParameter(answer)!=null){
                            answers[i-1]=request.getParameter(answer);
                        }else{
                            answers[i-1]="Z";
                        }
                    }
                    int score=0;
                  for (int i=0; i<questionsList.size();i++){
                      if (questionsList.get(i).getAnswer().matches(answers[i])){
                          score++;
                      }
                  }
                  Student student=new Student();
                  student.setRoll(request.getParameter("student_roll"));
                  student.setScore(score);
                  new UserService().update_student_score(student);

                  HttpSession session=request.getSession(true);
                  request.setAttribute("student_name", session.getAttribute("student_name"));
                  request.setAttribute("score", score);
                  request.setAttribute("total", questionsList.size());
                  request.getSession().invalidate();


                    RequestDispatcher rd=request.getRequestDispatcher("Student/remark.jsp");
                    rd.forward(request,response);
                }
            if (!page.equalsIgnoreCase("updateQuestion")) {
                int start = 0;
                int end = 0;
                if (page.equalsIgnoreCase("view_english")) {
                    start = 1;
                    end = 20;
                }
                if (page.equalsIgnoreCase("view_mathematics")) {
                    start = 21;
                    end = 40;
                }
                if (page.equalsIgnoreCase("view_physics")) {
                    start = 41;
                    end = 60;
                }
                if (page.equalsIgnoreCase("view_chemistry")) {
                    start = 61;
                    end = 80;
                }
                if (page.equalsIgnoreCase("view_iq")) {
                    start = 81;
                    end = 90;
                }
                for (int i = start; i <= end; i++) {
                    String question_name = "question" + i;
                    String A = "answer" + i + "A";
                    String B = "answer" + i + "B";
                    String C = "answer" + i + "C";
                    String D = "answer" + i + "D";
                    String answer = "answer" + i;

                    String question = request.getParameter(question_name);
                    String optionA = request.getParameter(A);
                    String optionB = request.getParameter(B);
                    String optionC = request.getParameter(C);
                    String optionD = request.getParameter(D);
                    String correct_answer = request.getParameter(answer);

                    Questions questions = new Questions();
                    questions.setId(i);
                    questions.setQuestion(question);
                    questions.setOptionA(optionA);
                    questions.setOptionB(optionB);
                    questions.setOptionC(optionC);
                    questions.setOptionD(optionD);
                    questions.setAnswer(correct_answer);
                    new UserService().insert(questions);
                }
                redirectToList(request, response);
            } else {
                if (page.equalsIgnoreCase("updateQuestion")) {

                    Questions questions = new Questions();
                    questions.setId(Integer.parseInt(request.getParameter("id")));
                    questions.setQuestion(request.getParameter("question"));
                    questions.setOptionA(request.getParameter("A"));
                    questions.setOptionB(request.getParameter("B"));
                    questions.setOptionC(request.getParameter("C"));
                    questions.setOptionD(request.getParameter("D"));
                    questions.setAnswer(request.getParameter("answer"));

                    new UserService().updateQuestion(questions);
                    redirectToListwithId(request, response);
                }
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        new UserServlet().check_Session(request,response);
            if (page.equalsIgnoreCase("english")) {
                RequestDispatcher rd = request.getRequestDispatcher("SetQuestions/english.jsp");
                rd.forward(request, response);

            }
            if (page.equalsIgnoreCase("mathematics")) {
                RequestDispatcher rd = request.getRequestDispatcher("SetQuestions/mathematics.jsp");
                rd.forward(request, response);
            }
            if (page.equalsIgnoreCase("physics")) {
                RequestDispatcher rd = request.getRequestDispatcher("SetQuestions/physics.jsp");
                rd.forward(request, response);
            }
            if (page.equalsIgnoreCase("chemistry")) {
                RequestDispatcher rd = request.getRequestDispatcher("SetQuestions/chemistry.jsp");
                rd.forward(request, response);
            }
            if (page.equalsIgnoreCase("iq")) {
                RequestDispatcher rd = request.getRequestDispatcher("SetQuestions/iq.jsp");
                rd.forward(request, response);
            }
            if (page.equalsIgnoreCase("view_english") || page.equalsIgnoreCase("view_mathematics") ||
                    page.equalsIgnoreCase("view_physics") || page.equalsIgnoreCase("view_chemistry") ||
                    page.equalsIgnoreCase("view_iq")) {
                redirectToList(request, response);
            }
            if (page.equalsIgnoreCase("view_as_student")){
                List<Questions> questionsList=new ArrayList<Questions>();
                questionsList=new UserService().getQuestionsList("whole_paper");
                request.setAttribute("sectionA", "Section A: English");
                request.setAttribute("sectionB", "Section B: Mathematics");
                request.setAttribute("sectionC", "Section C: Physics");
                request.setAttribute("sectionD", "Section D: Chemistry");
                request.setAttribute("sectionE", "Section E: IQ");
                request.setAttribute("questionsList", questionsList);
                RequestDispatcher rd=request.getRequestDispatcher("ViewPaper/view_as_student.jsp");
                rd.forward(request,response);
            }
            if (page.equalsIgnoreCase("delete_paper")) {
                new UserService().delete();
                List<Questions> questionsList=new ArrayList<Questions>();
                questionsList=new UserService().getQuestionsList("whole_paper");
                request.setAttribute("sectionA", "Section A: English");
                request.setAttribute("sectionB", "Section B: Mathematics");
                request.setAttribute("sectionC", "Section C: Physics");
                request.setAttribute("sectionD", "Section D: Chemistry");
                request.setAttribute("sectionE", "Section E: IQ");
                request.setAttribute("questionsList", questionsList);
                RequestDispatcher rd=request.getRequestDispatcher("ViewPaper/view_as_student.jsp");
                rd.forward(request,response);
                //redirectToList(request,response);
            }
            if (page.equalsIgnoreCase("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                new UserService().qdelete(id);
                redirectToListwithId(request, response);
            }
            if (page.equalsIgnoreCase("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Questions questions = new UserService().getQuestions(id);
                request.setAttribute("questions", questions);
                RequestDispatcher rd = request.getRequestDispatcher("ViewPaper/edit.jsp");
                rd.forward(request, response);
            }
            if (page.equalsIgnoreCase("pdelete")){
                RequestDispatcher rd=request.getRequestDispatcher("Admin/delete_paper.jsp");
                rd.forward(request, response);
            }
            if (page.equalsIgnoreCase("delete_english")){
                new UserService().delete_paper("english");
                redirectToList(request,response);
            }
            if (page.equalsIgnoreCase("delete_mathematics")){
                new UserService().delete_paper("mathematics");
                redirectToList(request,response);
            }
            if (page.equalsIgnoreCase("delete_physics")){
                new UserService().delete_paper("physics");
                redirectToList(request,response);
            }
            if (page.equalsIgnoreCase("delete_chemistry")){
                new UserService().delete_paper("chemistry");
                redirectToList(request,response);
            }
            if (page.equalsIgnoreCase("delete_iq")){
                new UserService().delete_paper("iq");
                redirectToList(request,response);
            }
        if (page.equalsIgnoreCase("view_result")){
            redirectToResult(request,response);
        }
        if (page.equalsIgnoreCase("delete_result")){
            new UserService().delete_result();
            redirectToResult(request,response);
        }
        if (page.equalsIgnoreCase("export_result")){
            List<Student> studentList=new ArrayList<Student>();
            studentList=new UserService().getStudentList();
            request.setAttribute("studentList", studentList);
            RequestDispatcher rd=request.getRequestDispatcher("Admin/export_excel.jsp");
            rd.forward(request,response);
        }
    }
    private void redirectToResult(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        List<Student> studentList=new ArrayList<Student>();
        studentList=new UserService().getStudentList();
        request.setAttribute("studentList", studentList);
        RequestDispatcher rd=request.getRequestDispatcher("Admin/view_result.jsp");
        rd.forward(request,response);
    }
    private void redirectToListwithId(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        int id=Integer.parseInt(request.getParameter("id"));
        List<Questions> questionsList=new ArrayList<Questions>();
        if (0<id && id<21){
            questionsList=new UserService().getQuestionsList("english");
            request.setAttribute("section", "Section A: English");

        }else{
            if (20<id && id<41){
                questionsList=new UserService().getQuestionsList("mathematics");
                request.setAttribute("section", "Section B: Mathematics");
            }else{
                if (40<id && id<61){
                    questionsList=new UserService().getQuestionsList("physics");
                    request.setAttribute("section", "Section C: Physics");
                }else{
                    if (60<id && id<81){
                        questionsList=new UserService().getQuestionsList("chemistry");
                        request.setAttribute("section", "Section D: Chemistry");
                    }else{
                        if (80<id && id<91){
                            questionsList=new UserService().getQuestionsList("iq");
                            request.setAttribute("section", "Section E: IQ");
                        }
                    }
                }
            }
        }

        request.setAttribute("questionsList", questionsList);
        RequestDispatcher rd=request.getRequestDispatcher("ViewPaper/view_subject.jsp");
        rd.forward(request,response);
    }
    private void redirectToList(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String page=request.getParameter("page");
        List<Questions> questionsList=new ArrayList<Questions>();

        if (page.equalsIgnoreCase("view_english") || page.equalsIgnoreCase("delete_english")){
            questionsList=new UserService().getQuestionsList("english");
            request.setAttribute("section", "Section A: English");
        }else{
            if (page.equalsIgnoreCase("view_mathematics") || page.equalsIgnoreCase("delete_mathematics")){
                questionsList=new UserService().getQuestionsList("mathematics");
                request.setAttribute("section", "Section B: Mathematics");
            }else{
                if (page.equalsIgnoreCase("view_physics")|| page.equalsIgnoreCase("delete_physics")){
                    questionsList=new UserService().getQuestionsList("physics");
                    request.setAttribute("section", "Section C: Physics");
                }else{
                    if (page.equalsIgnoreCase("view_chemistry") || page.equalsIgnoreCase("delete_chemistry")){
                        questionsList=new UserService().getQuestionsList("chemistry");
                        request.setAttribute("section", "Section D: Chemistry");
                    }else{
                        if (page.equalsIgnoreCase("view_iq") || page.equalsIgnoreCase("delete_iq")){
                            questionsList=new UserService().getQuestionsList("iq");
                            request.setAttribute("section", "Section E: IQ");
                        }
                    }
                }
            }
        }
        request.setAttribute("questionsList", questionsList);
        RequestDispatcher rd=request.getRequestDispatcher("ViewPaper/view_subject.jsp");
        rd.forward(request,response);
    }
}
