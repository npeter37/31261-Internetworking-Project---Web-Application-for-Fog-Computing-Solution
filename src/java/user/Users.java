package user;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;
import org.mindrot.jbcrypt.BCrypt;

@XmlRootElement(name = "users")
@XmlAccessorType(XmlAccessType.FIELD)
public class Users implements Serializable {


    @XmlElement(name = "user")
    private ArrayList<User> list = new ArrayList<User>();


    public ArrayList<User> getList() {
        return list;
    }

    public void addUser(User user) {
        list.add(user);
    }

    public void removeUser(User user) {
        list.remove(user);
    }

    public User getUser(String email) {
        for (User user : list) {
            if (user.getEmail().equals(email)) {
                return user;
            }
        }
        return null;
    }

    public User login(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user; // Login correct. Return this user.
            }
        }
        return null; // Login incorrect. Return null.
    }

    //public static String Hashpw(String password) throws IllegalArgumentException {
        //String hashed_pw = BCrypt.hashpw(password, BCrypt.gensalt(workload));
        //return hashed_pw;
    //}

    /*public static boolean checkpw(String plain_pw, String hashed) {
        boolean verified_pw = false;
        
        if (null == hashed) 
            throw new java.lang.IllegalArgumentException("Invalid Hash provided for comparison");
        verified_pw = BCrypt.checkpw(plain_pw,hashed);
        return verified_pw;
    }*/
}
