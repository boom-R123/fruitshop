package User.valuebean;

public class GoodsSingle {
	private String id;							//������Ʒ���
	private String name;						//������Ʒ����
	private float price;						//������Ʒ�۸�
	private int num;							//������Ʒ��������
	private int inventory;						//������Ʒ���
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
}
