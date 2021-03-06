package entity;

import java.io.Serializable;

public class User  implements Serializable {

    private int idUser;
    private String userName;
    private String password;
    private int balance;

    public User(String userName, String password, int balance) {
        this.userName = userName;
        this.password = password;
        this.balance = balance;
    }

    public User(int idUser, String userName, String password, int balance) {
        this.idUser = idUser;
        this.userName = userName;
        this.password = password;
        this.balance = balance;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "User{" + "idUser=" + idUser + ", userName=" + userName + ", password=" + password + ", balance=" + balance + '}';
    }

}
