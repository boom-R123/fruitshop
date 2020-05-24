package User.servlet;

import User.toolbean.DB;
import User.valuebean.GoodsSingle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IndexServlet extends HttpServlet {
	private static ArrayList goodslist=new ArrayList();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("goodslist",goodslist);
		response.sendRedirect("show.jsp");
	}
	static{										//静态代码块,读取数据库中的数据，初始化商品列表
		List<String> id=new ArrayList();//水果编号
		List<String> names=new ArrayList();//水果名字
		List<Float> prices=new ArrayList();//水果价格
		List<Integer> inventory=new ArrayList();//水果库存
		DB db = new DB();
		ResultSet rst = null;
		String sql = "select * from fruitshop.fruit";
		db.inputSQL(sql);
		try {
			rst = db.pst.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		while(true)
		{
			try {
				if (!rst.next()) break;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				String s1=rst.getString("id");
				id.add(s1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				String s2 = rst.getString("name");
				names.add(s2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				float s3 = rst.getFloat("price");
				prices.add(s3);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				int s4 = rst.getInt("inventory");
				inventory.add(s4);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		for(int i=0;i<names.size();i++){
			GoodsSingle single=new GoodsSingle();
			single.setName(names.get(i));
			single.setPrice(prices.get(i));
			single.setNum(1);
			single.setId(id.get(i));
			single.setInventory(inventory.get(i));
			goodslist.add(single);
		}
	}
}