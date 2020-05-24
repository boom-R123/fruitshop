package JavaBean;

import java.util.ArrayList;

public class User {
    private String userName; //用户名
    private String passWord; //用户密码
    private int type;//用户种类 :如果是1则是普通用户，如果是2则是会员

    public User(){}

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

}
