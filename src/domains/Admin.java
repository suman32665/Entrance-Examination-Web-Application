package domains;

/**
 * Created by suman maharjan on 09/09/2016.
 */
public class Admin {
    int id;
    String name;
    String password;

    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id=id;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name=name;
    }
    public String getPassword()
    {
        return password;
    }
    public void setPassword(String password){ this.password=password; }

}