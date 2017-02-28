/**
 * Created by suman maharjan on 15/09/2016.
 */
function create_table(count)
{
    var table="";
    var text="text";
    var placeholder="A/B/C/D"
    var space1=". ";
    var space=" ";
    var question_count=20;
    if (count==81){
        question_count=10;
    }

    for (var i=0;i<question_count;i++){
        var k=i+1;
        var j=i+count;
        var questionName="question"+j;
        var A="answer"+j +"A";
        var B="answer"+j +"B";
        var C="answer"+j +"C";
        var D="answer"+j +"D";
        var correctAnswer="answer"+j;
        table+="<tr><td>"+k+space1+"<input type="+text+" name="+questionName+" id=question></td></tr>"+
                "<tr><td>A"+space+"<input type="+text+" name="+A+" id=answer></td></tr>"+
            "<tr><td>B"+space+"<input type="+text+" name="+B+" id=answer></td></tr>"+
            "<tr><td>C"+space+"<input type="+text+" name="+C+" id=answer></td></tr>"+
            "<tr><td>D"+space+"<input type="+text+" name="+D+" id=answer></td></tr>"+
            //    "<tr><td>Answer:"+space+"<select name="+ correctAnswer + ">" +
            //"<option value='A'>A</option>" +
            //"<option value='B'>B</option>" +
            //"<option value='C'>C</option>" +
            //"<option value='D'>D</option>" +
            //"</td></tr>";
            "<tr><td>Answer:"+space+"<input type="+text+" placeholder="+placeholder+" name="+ correctAnswer +" id=answer></td></tr>";

    }
    document.getElementById("tables").innerHTML=table;
}
function create_studentForm(number)
{
    var table="";
    var count=Number(number);
    for (var i=0; i<count;i++){
        var j=i+1;
        var name="name"+i;
        var roll="roll"+i;
        table=table+"<tr><td>"+ j +". <input type='text' name="+name+" placeholder='Student Name'>"+
                "<input type='text' name="+roll+" placeholder='Student Roll Number'></td></tr>";

    }
    table=table+"<tr><td><input type='submit' value=' Add ' id='questionbutton'></td></tr>"
    document.getElementById("tables").innerHTML=table;
}