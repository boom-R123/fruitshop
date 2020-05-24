package User;

import JavaBean.Cont;
import JavaBean.Income;
import JavaBean.User;
import JavaBean.fruit;
import User.toolbean.DB;
import User.valuebean.GoodsSingle;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class function {
    private static DB db;
    private static ResultSet rst = null;

    public function() {
        db = new DB();
    }

    public static int Login(String name, String password) throws SQLException {
        String sql = "select * from fruitshop.user where username= ?";
        db.inputSQL(sql);
        db.pst.setString(1, name);
        rst = db.pst.executeQuery();
        if (rst.next() == false) {
            return -1;  //无此账号
        } else {
            if (rst.getString("password").equals(password)) {
                return rst.getInt("type");  //登录成功
            } else
                return 0;  //密码错误
        }
    }

    public static Boolean Register(String name, String password, int type) throws SQLException {
        String sql = "select * from fruitshop.user where username = ?";
        db.inputSQL(sql);
        db.pst.setString(1, name);
        rst = db.pst.executeQuery();
        if (rst.next() == true) {
            return false;
        } else {
            //插入
            sql = "insert into fruitshop.user values(?,?,?)";
            db.inputSQL(sql);
            db.pst.setString(1, name);
            db.pst.setString(2, password);
            db.pst.setInt(3, type);
            int result = db.pst.executeUpdate();
            if (result > 0)
                return true;
            else
                return false;
        }
    }

    public static Boolean Buy(List<GoodsSingle> buylist) throws SQLException {
        for (int i = 0; i < buylist.size(); i++) {
            System.out.println(1);
            String sql = "update fruitshop.fruit set inventory=inventory-? where id = ?";
            db.inputSQL(sql);
            db.pst.setInt(1, buylist.get(i).getNum());
            db.pst.setString(2, buylist.get(i).getId());
            db.pst.executeUpdate();
            sql = "update fruitshop.fruit set selled=selled+? where id = ?";
            db.inputSQL(sql);
            db.pst.setInt(1, buylist.get(i).getNum());
            db.pst.setString(2, buylist.get(i).getId());
            db.pst.executeUpdate();
        }
        return true;
    }

    public static ArrayList<Cont> Getfeedback() throws SQLException {
        ArrayList<Cont> fb = new ArrayList();
        String sql = "select * from fruitshop.feedback";
        db.inputSQL(sql);
        rst = db.pst.executeQuery();
        while (rst.next()) {
            Cont f = new Cont();
            int id = rst.getInt("id");
            f.setId(id);
            String s1 = rst.getString("name");
            f.setAuthor(s1);
            String s2 = rst.getString("title");
            f.setTitle(s2);
            String s3 = rst.getString("content");
            f.setContent(s3);
            String s4 = rst.getString("time");
            f.setTime(s4);
            fb.add(f);
        }
        return fb;
    }

    public static void Addfeedback(String name, String title, String content, String time) throws SQLException {
        String sql = "select * from fruitshop.feedback";
        db.inputSQL(sql);
        rst = db.pst.executeQuery();
        int length = 0;
        while (rst.next()) {
            length++;
        }
        sql = sql = "insert into fruitshop.feedback values(?,?,?,?,?)";
        db.inputSQL(sql);
        db.pst.setInt(1, length);
        db.pst.setString(2, name);
        db.pst.setString(3, title);
        db.pst.setString(4, content);
        db.pst.setString(5, time);
        int result = db.pst.executeUpdate();
    }

    public static void ChangeToVip(String name) throws SQLException {
        String sql = "update fruitshop.user set type=2 where username = ?";
        db.inputSQL(sql);
        db.pst.setString(1, name);
        db.pst.executeUpdate();
    }

    public static void Addincome(String content, String time, float money) throws SQLException {
        String sql = "select * from fruitshop.income";
        db.inputSQL(sql);
        rst = db.pst.executeQuery();
        int length = 0;
        while (rst.next()) {
            length++;
        }
        sql = sql = "insert into fruitshop.income values(?,?,?,?)";
        db.inputSQL(sql);
        db.pst.setInt(1, length);
        db.pst.setString(2, content);
        db.pst.setFloat(3, money);
        db.pst.setString(4, time);
        db.pst.executeUpdate();
    }

    public static List<Income> GetIncome() throws SQLException {
        List<Income> incomes = new ArrayList<>();
        String sql = "select * from fruitshop.income";
        db.inputSQL(sql);
        rst = db.pst.executeQuery();
        while (rst.next()) {
            Income ic = new Income();
            int id = rst.getInt("id");
            ic.setId(id);
            String s1 = rst.getString("content");
            ic.setContent(s1);
            float s2 = rst.getFloat("money");
            ic.setMoney(s2);
            String s3 = rst.getString("time");
            ic.setDate(s3);
            incomes.add(ic);
        }
        return incomes;
    }

    public static List<Income> GetSpend() throws SQLException {
        List<Income> incomes = new ArrayList<>();
        String sql = "select * from fruitshop.spend";
        db.inputSQL(sql);
        rst = db.pst.executeQuery();
        while (rst.next()) {
            Income ic = new Income();
            int id = rst.getInt("id");
            ic.setId(id);
            String s1 = rst.getString("content");
            ic.setContent(s1);
            float s2 = rst.getFloat("money");
            ic.setMoney(s2);
            String s3 = rst.getString("time");
            ic.setDate(s3);
            incomes.add(ic);
        }
        return incomes;
    }

    public static List<fruit> GetFruit() throws SQLException {
        List<fruit> fruits = new ArrayList<>();
        String sql = "select * from fruitshop.fruit";
        db.inputSQL(sql);
        rst = db.pst.executeQuery();
        while (rst.next()) {
            fruit f = new fruit();
            String id = rst.getString("id");
            f.setId(id);
            String s1 = rst.getString("name");
            f.setName(s1);
            int s2 = rst.getInt("inventory");
            f.setInventory(s2);
            int s3 = rst.getInt("selled");
            f.setSell(s3);
            fruits.add(f);
        }
        return fruits;
    }

    public static Boolean Stock(String id,int num) throws SQLException {
        String sql = "update fruitshop.fruit set inventory=inventory+? where id = ?";
        db.inputSQL(sql);
        db.pst.setInt(1, num);
        db.pst.setString(2,id);
        db.pst.executeUpdate();
        return true;
    }

    public static void AddSpend(String content, String time, float money) throws SQLException {
        String sql = "select * from fruitshop.spend";
        db.inputSQL(sql);
        rst = db.pst.executeQuery();
        int length = 0;
        while (rst.next()) {
            length++;
        }
        sql = sql = "insert into fruitshop.spend values(?,?,?,?)";
        db.inputSQL(sql);
        db.pst.setInt(1, length);
        db.pst.setString(2, content);
        db.pst.setFloat(3, money);
        db.pst.setString(4, time);
        db.pst.executeUpdate();
    }

    public static List<User> GetUser() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "select * from fruitshop.user";
        db.inputSQL(sql);
        rst = db.pst.executeQuery();
        while (rst.next()) {
            User u = new User();
            String name = rst.getString("username");
            u.setUserName(name);
            String password=rst.getString("password");
            u.setPassWord(password);
            int type = rst.getInt("type");
            u.setType(type);
            users.add(u);
        }
        return users;
    }

    public static boolean ChangeType(String name) throws SQLException {
        String sql = "select * from fruitshop.user where username= ?";
        db.inputSQL(sql);
        db.pst.setString(1, name);
        rst = db.pst.executeQuery();
        rst.next();
        int type=rst.getInt("type");
        if(type==1){
            type=2;
        }else{
            type=1;
        }
        sql="update fruitshop.user set type= ? where username = ?";
        db.inputSQL(sql);
        db.pst.setInt(1, type);
        db.pst.setString(2,name);
        db.pst.executeUpdate();
        return true;
    }
}
