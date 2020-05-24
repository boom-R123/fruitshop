package User.servlet;

import User.toolbean.MyTools;
import User.toolbean.ShopCar;
import User.valuebean.GoodsSingle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class BuyServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");	//��ȡaction����ֵ
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		if(action==null)
			action="";
		if(action.equals("buy"))					//�����ˡ���������
			buy(request,response);						//����buy()����ʵ����Ʒ�Ĺ���
		if(action.equals("remove"))					//�����ˡ��Ƴ�������
			remove(request,response);					//����remove()����ʵ����Ʒ���Ƴ�
		if(action.equals("clear"))					//�����ˡ���չ��ﳵ������
			clear(request,response);					//����clear()����ʵ�ֹ��ﳵ�����
	}
	//ʵ�ֹ�����Ʒ�ķ���
	protected void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String strId=request.getParameter("id");		//��ȡ��������������ʱ���ݵ�id�������ò����洢������Ʒ��goodslist�����д洢��λ��	
		int id=MyTools.strToint(strId);
		
		ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");
		GoodsSingle single=(GoodsSingle)goodslist.get(id);
		if(single.getInventory()==0){//�Ѿ�û�п�棬��ֱ�ӷ���ҳ��
			response.sendRedirect("show.jsp");				//�������ض���show.jspҳ��
			return;
		}
		else{
			int n=single.getInventory()-1; //����һ
			single.setInventory(n);;
		}
		ArrayList buylist=(ArrayList)session.getAttribute("buylist");		//��session��Χ�ڻ�ȡ�洢���û��ѹ�����Ʒ�ļ��϶���
		if(buylist==null)
			buylist=new ArrayList();
		
		ShopCar myCar=new ShopCar();
		myCar.setBuylist(buylist); 						//��buylist����ֵ��ShopCar��ʵ���е�����
		myCar.addItem(single);							//����ShopCar����addItem()����ʵ����Ʒ��Ӳ���
		
		session.setAttribute("buylist",buylist);
		response.sendRedirect("jsp/show.jsp");				//�������ض���show.jspҳ��
	}
	//ʵ���Ƴ���Ʒ�ķ���
	protected void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		ArrayList buylist=(ArrayList)session.getAttribute("buylist");
		String name=request.getParameter("name");
		ShopCar myCar=new ShopCar();
		myCar.setBuylist(buylist);						//��buylist����ֵ��ShopCar��ʵ���е�����
		myCar.removeItem(name);		//����ShopCar����removeItem ()����ʵ����Ʒ�Ƴ�����
		ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");

		for(int j=0;j<goodslist.size();j++){//�޸Ŀ����
			GoodsSingle temp=(GoodsSingle)goodslist.get(j);
			if(temp.getName().equals(name)){
				temp.setInventory(temp.getInventory()+1);
			}
		}
		response.sendRedirect("jsp/shopcar.jsp");
	}
	//ʵ����չ��ﳵ�ķ���
	protected void clear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		ArrayList buylist=(ArrayList)session.getAttribute("buylist");			//��session��Χ�ڻ�ȡ�洢���û��ѹ�����Ʒ�ļ��϶���			//���buylist���϶���ʵ�ֹ��ﳵ��յĲ���
		ArrayList goodslist=(ArrayList)session.getAttribute("goodslist");
		if(buylist==null){}
		else{
			for(int i=0;i<buylist.size();i++){//�޸Ŀ����
				GoodsSingle single=(GoodsSingle)buylist.get(i);
				for(int j=0;j<goodslist.size();j++){
					GoodsSingle temp=(GoodsSingle)goodslist.get(j);
					if(temp.getId().equals(single.getId())){
						temp.setInventory(temp.getInventory()+single.getNum());
					}
				}
			}
			buylist.clear();
		}
		response.sendRedirect("jsp/shopcar.jsp");
	}
}