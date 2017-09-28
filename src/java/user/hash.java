/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Peter Nguyen
 */
public class hash {

    private static int workload = 12;

    public static String hashpw(String password, String salt) throws IllegalArgumentException {
        String hashed_pw = BCrypt.hashpw(password, BCrypt.gensalt(workload));
        return hashed_pw;
    }

    public static boolean checkpw(String password, String hashed) {
        boolean pw_verified = false;

        if (null == hashed) {
            throw new java.lang.IllegalArgumentException("Hash does not match");
        }

        pw_verified = BCrypt.checkpw(password, hashed);
        return pw_verified;
    }

    public static void main(String[] args) {
        String password = "password123";
        String hashed_pw = BCrypt.hashpw(password, BCrypt.gensalt(workload));
        System.out.println("Password is: " + password);
        System.out.println();
        System.out.println("The computed hash is: " + hashed_pw);

    }
}
