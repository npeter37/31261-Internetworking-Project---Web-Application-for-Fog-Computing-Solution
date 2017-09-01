/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.*;
import static java.lang.System.out;
import javax.xml.bind.*;

public class UsersApp implements Serializable{
    private String filePath; 
    private Users users;
    
    public UsersApp() {
    
    }

    public UsersApp(String filePath, Users users) {
        super();
        this.filePath = filePath;
        this.users = users;
    }

    public String loginusers() {
        return filePath;
    }

    public void setFilePath(String filePath) throws Exception {
        
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        users = (Users) u.unmarshal(fin); 		
        fin.close();
    }
    
    public void updateXML(Users users) throws Exception {
        this.users = users;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(users, fout);
        fout.close();
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
