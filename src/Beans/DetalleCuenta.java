package Beans;

public class DetalleCuenta {
	
        int id;
	int orderId; 
	int tableNo;
	String orderName;
	String itemName;
	int itemQnt;
	int orderQnt;
	String itemCost;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getTableNo() {
		return tableNo;
	}

	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemQnt() {
		return itemQnt;
	}

	public void setItemQnt(int itemQnt) {
		this.itemQnt = itemQnt;
	}

	public int getOrderQnt() {
		return orderQnt;
	}

	public void setOrderQnt(int orderQnt) {
		this.orderQnt = orderQnt;
	}

	public String getItemCost() {
		return itemCost;
	}

	public void setItemCost(String itemCost) {
		this.itemCost = itemCost;
	}
        
        @Override
        public String toString() {
            return "DetalleCuenta{" + "id=" + id + ", orderId=" + orderId + ", tableNo=" + tableNo + ", orderName=" + orderName + ", itemName=" + itemName + ", itemQnt=" + itemQnt + ", orderQnt=" + orderQnt + ", itemCost=" + itemCost + '}';
        }
}
