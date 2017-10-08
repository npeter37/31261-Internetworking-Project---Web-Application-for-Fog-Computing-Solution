package user;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;
import org.mindrot.jbcrypt.BCrypt;

@XmlRootElement(name = "users")
@XmlAccessorType(XmlAccessType.FIELD)
public class Users implements Serializable {

    private static int workload = 12;

    private static int attempt = 3;

    //private int loginAttempts = 3;
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
        return null;
    }

    //public static String Hashpw(String password) throws IllegalArgumentException {
    //String hashed_pw = BCrypt.hashpw(password, BCrypt.gensalt(workload));
    //return hashed_pw;
    //}
    public User loginhashed(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            String hashed_pw = user.getHashed_pw();
            if (user.getEmail().equals(email)) {
                //String hashed_pw = BCrypt.checkpw(password, hashed);
                if (BCrypt.checkpw(password, hashed_pw)) {
                    return user;
                }
                return null;
            }
        }
        attempt--;
        return null; // Login incorrect. Return null.
    }

    public User loginAttempt(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user; // Login correct. Return this user.
            }
        }
        attempt--;
        return null;
    }
        public static int getAttempt() {
        return attempt;
    }
}
//user.getPassword().equals(BCrypt.checkpw(password, hashed_pw)
