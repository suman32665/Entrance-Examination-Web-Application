package service;

import domains.Admin;
import domains.Questions;
import domains.Student;
import utils.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by suman maharjan on 09/09/2016.
 */
public class UserService {
    public Admin getAdmin(String name, String password){
        Admin admin=null;
        try{
            String query="select * from admin where username=? and password=?";
            PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);

            pstm.setString(1, name);
            pstm.setString(2, password);
            ResultSet rs=pstm.executeQuery();
            while (rs.next()){
                admin=new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return admin;
    }
    public Student getStudent(String name, String roll){
        Student student=null;
        try{
            String query="select * from student where name=? and roll=?";
            PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);

            pstm.setString(1, name);
            pstm.setString(2, roll);
            ResultSet rs=pstm.executeQuery();
            while (rs.next()){
                student=new Student();
                student.setName(rs.getString("name"));
                student.setRoll(rs.getString("roll"));
                student.setAttempt(rs.getInt("attempt"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return student;
    }
    public Admin getAdminById(int id){
        Admin admin=null;
        try{
            String query="select * from admin where id=?";
            PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);

            pstm.setInt(1,id);
            ResultSet rs=pstm.executeQuery();
            while (rs.next()){
                admin=new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return admin;
    }
    public void insert(Questions questions)
    {
        String query="insert into questions (question,A,B,C,D,answer, id) values(?,?,?,?,?,?,?)";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
        try {
            pstm.setString(1, questions.getQuestion());
            pstm.setString(2, questions.getOptionA());
            pstm.setString(3, questions.getOptionB());
            pstm.setString(4, questions.getOptionC());
            pstm.setString(5, questions.getOptionD());
            pstm.setString(6, questions.getAnswer());
            pstm.setInt(7, questions.getId());
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void insert_Student(Student student)
    {
        String query="insert into student (name,roll,score,attempt) values(?,?,0,1)";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
        try{
            pstm.setString(1, student.getName());
            pstm.setString(2, student.getRoll());
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void delete(){
        String query="delete from questions";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
        try {
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void delete_result(){
        String query="drop table student";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
        try{
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        query="CREATE TABLE `dat`.`student` ( `id` INT(5) NOT NULL AUTO_INCREMENT , " +
                "`name` VARCHAR(100) NOT NULL , `roll` VARCHAR(100) NOT NULL ," +
                " `score` INT(5) NOT NULL , `attempt` INT(1) NOT NULL , " +
                "PRIMARY KEY (`id`)) ENGINE = InnoDB;";
        pstm=new DatabaseConnection().getPreparedStatement(query);
        try {
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void delete_paper(String subject)
    {
        String query=null;
        if (subject.matches("english")){
            query="delete from questions where id between 1 and 20";
        }else{
            if (subject.matches("mathematics")){
                query="delete from questions where id between 21 and 40";
            }else {
                if (subject.matches("physics")) {
                    query = "delete from questions where id between 41 and 60";
                } else {
                    if (subject.matches("chemistry")) {
                        query = "delete from questions where id between 61 and 80";
                    } else {
                        if (subject.matches("iq")) {
                            query = "delete from questions where id between 81 and 90";
                        }
                    }
                }
            }
        }
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
        try {
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void qdelete(int id){
        String query="delete from questions where id=?";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
        try {
            pstm.setInt(1, id);
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Questions> getQuestionsList(String subject){
        List<Questions> questionsList=new ArrayList<Questions>();
        int start=0;
        int end=0;
        if (subject.matches("english")){
            start=1;
            end=20;
        }else{
            if (subject.matches("mathematics")){
                start=21;
                end=40;
            }else{
                if (subject.matches("physics")){
                    start=41;
                    end=60;
                }else{
                    if (subject.matches("chemistry")){
                        start=61;
                        end=80;
                    }else{
                        if (subject.matches("iq")){
                            start=81;
                            end=90;
                        }else{
                            if (subject.matches("whole_paper")){
                                start=1;
                                end=90;
                            }
                        }
                    }
                }
            }
        }
        try {
            String query="select * from questions where id BETWEEN ? And ?";
            PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
            pstm.setInt(1, start);
            pstm.setInt(2, end);
            ResultSet rs=pstm.executeQuery();
            while (rs.next()){
                Questions questions=new Questions();
                questions.setId(rs.getInt("id"));
                questions.setQuestion(rs.getString("question"));
                questions.setOptionA(rs.getString("A"));
                questions.setOptionB(rs.getString("B"));
                questions.setOptionC(rs.getString("C"));
                questions.setOptionD(rs.getString("D"));
                questions.setAnswer(rs.getString("answer"));

                questionsList.add(questions);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionsList;
    }
    public List<Student> getStudentList() {
        List<Student> studentList=new ArrayList<Student>();
        String query="select * from student";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
        try {
            ResultSet rs=pstm.executeQuery();
            while (rs.next()){
                Student student=new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setRoll(rs.getString("roll"));
                student.setScore(rs.getInt("score"));
                student.setAttempt(rs.getInt("attempt"));
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }
    public Questions getQuestions(int id)
    {
        Questions questions=null;

        String query="select * from questions where id=?";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);
        try {
            pstm.setInt(1, id);
            ResultSet rs=pstm.executeQuery();
            while (rs.next()){
                questions=new Questions();
                questions.setId(rs.getInt("id"));
                questions.setQuestion(rs.getString("question"));
                questions.setOptionA(rs.getString("A"));
                questions.setOptionB(rs.getString("B"));
                questions.setOptionC(rs.getString("C"));
                questions.setOptionD(rs.getString("D"));
                questions.setAnswer(rs.getString("answer"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return questions;
    }
    public void updateQuestion(Questions questions){
        String query="update questions set question=?, A=?, B=?, C=?, D=?, answer=? where id=?";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);

        try {
            pstm.setString(1, questions.getQuestion());
            pstm.setString(2, questions.getOptionA());
            pstm.setString(3, questions.getOptionB());
            pstm.setString(4, questions.getOptionC());
            pstm.setString(5, questions.getOptionD());
            pstm.setString(6, questions.getAnswer());
            pstm.setInt(7, questions.getId());
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void update_adminInfo(Admin admin){
        String query="update admin set username=?, password=? where id=?";
        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);

        try {
            pstm.setString(1,admin.getName());
            pstm.setString(2,admin.getPassword());
            pstm.setInt(3,admin.getId());
            pstm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void update_student_score(Student student){
        String query="update student set score=?, attempt=0 where roll=?";

        PreparedStatement pstm=new DatabaseConnection().getPreparedStatement(query);

        try{
            pstm.setInt(1, student.getScore());
            pstm.setString(2, student.getRoll());
            pstm.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
