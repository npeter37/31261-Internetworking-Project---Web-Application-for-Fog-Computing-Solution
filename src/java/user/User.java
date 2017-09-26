package user;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import org.mindrot.jbcrypt.BCrypt;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class User implements Serializable {

    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "mac")
    private String mac;
    @XmlElement(name = "privilege")
    private String privilege;
    @XmlElement(name = "verify")
    private String verify;
    private static int workload = 12;

    public User() {
    }

    public User(String name, String email, String password, String mac) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.mac = mac;
        this.privilege = "user";
        this.verify = verify;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        String hashed_pw = BCrypt.hashpw(password, BCrypt.gensalt(workload));
        this.password = hashed_pw;
    }

    //public static String Hashpw(String password) throws IllegalArgumentException {
       // String hashed_pw = BCrypt.hashpw(password, BCrypt.gensalt(workload));
        //return hashed_pw;
    //}

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    public String getPrivilege() {
        return privilege;
    }

    public void setPrivilege(String privilege) {
        this.privilege = privilege;
    }

    public String getVerify() {
        return verify;
    }

    public void setVerify(String verify) {
        this.verify = verify;
    }
}
