package User.toolbean;

import User.valuebean.GoodsSingle;

import java.util.ArrayList;

public class ShopCar {
	private ArrayList buylist=new ArrayList();									//�����洢�������Ʒ
	public void setBuylist(ArrayList buylist) {
		this.buylist = buylist;
	}
	/**
	 * @���� ���ﳵ�������Ʒ
	 * @���� singleΪGoodsSingle����󣬷�װ��Ҫ��ӵ���Ʒ��Ϣ
	 */
	public void addItem(GoodsSingle single){
		if(single!=null){
			if(buylist.size()==0){												//���buylist�в������κ���Ʒ
				GoodsSingle temp=new GoodsSingle();
				temp.setId(single.getId());
				temp.setInventory(single.getInventory());
				temp.setName(single.getName());
				temp.setPrice(single.getPrice());
				temp.setNum(single.getNum());
				buylist.add(temp);												//�洢��Ʒ
			}
			else{																//���buylist�д�����Ʒ	
				int i=0;				
				for(;i<buylist.size();i++){										//����buylist���϶����жϸü������Ƿ��Ѿ����ڵ�ǰҪ��ӵ���Ʒ		
					GoodsSingle temp=(GoodsSingle)buylist.get(i);				//��ȡbuylist�����е�ǰԪ��		
					if(temp.getId().equals(single.getId())){				//�жϴ�buylist�����л�ȡ�ĵ�ǰ��Ʒ�ı���Ƿ���Ҫ��ӵ���Ʒ�ı����ͬ
						//�����ͬ��˵���Ѿ������˸���Ʒ��ֻ��Ҫ����Ʒ�Ĺ���������1
						temp.setNum(temp.getNum()+1);							//����Ʒ����������1
						break;													//����forѭ��
					}
				}
				if(i>=buylist.size()){											//˵��buylist�в�����Ҫ��ӵ���Ʒ
					GoodsSingle temp=new GoodsSingle();
					temp.setId(single.getId());
					temp.setInventory(single.getInventory());
					temp.setName(single.getName());
					temp.setPrice(single.getPrice());
					temp.setNum(single.getNum());
					buylist.add(temp);											//�洢��Ʒ
				}
			}
		}			
	}
	/**
	 * @���� �ӹ��ﳵ���Ƴ�ָ�����Ƶ���Ʒ
	 * @���� name��ʾ��Ʒ����
	 */
	public void removeItem(String name){
		for(int i=0;i<buylist.size();i++){							//����buylist���ϣ�����ָ�����Ƶ���Ʒ
			GoodsSingle temp=(GoodsSingle)buylist.get(i);   		//��ȡ�����е�ǰλ�õ���Ʒ
			if(temp.getName().equals(name)){						//�����Ʒ������Ϊname����ָ��������
				if(temp.getNum()>1){								//�����Ʒ�Ĺ�����������1
					temp.setNum(temp.getNum()-1);					//�򽫹���������1
					break;				         					//����forѭ��
				}
				else if(temp.getNum()==1){							//�����Ʒ�Ĺ�������Ϊ1
					buylist.remove(i);		    					//��buylist���϶������Ƴ�����Ʒ
				}
			}
		}
	}
}