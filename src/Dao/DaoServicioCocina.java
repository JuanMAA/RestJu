
package Dao;

import java.util.ArrayList;
import Beans.Categoria;
import Beans.Producto;
import Beans.DetalleOrden;
import Beans.Orden;

public class DaoServicioCocina {
	ConexionBD dbc = new ConexionBD();
	
	public ArrayList<Categoria> getAllCategorys(){
		return dbc.getAllCategory();
	}
	
	public ArrayList<Orden> getAllOrders(){
		return dbc.getAllOrders();
	}
	public ArrayList<DetalleOrden> getAllItems(int orderId)
	{
		return dbc.getAllItems(orderId);
	}

	public boolean isAlreadyExists(String name) {
		return dbc.isAlreadyExists(name);
	}

	public boolean addCategory(String name) {
		return dbc.addCategory(name);
	}

	public boolean isItemAlreadyExists(String itemName) {		
		return dbc.isItemAlreadyExists(itemName);
	}

	public boolean addItem(Producto item) {		
		return dbc.addItem(item);
	}

	public boolean updateOrderStatus(int orderId, String status) {		
		return dbc.updateOrderStatus(orderId, status);
	}

	public boolean updateItemStatus(int orderId, int itemId, String status) {		
		return dbc.updateItemStatus(orderId, itemId, status);
	}

	public boolean addOrder(Orden orderMaster) {		
		return dbc.addOrder(orderMaster);
	}

	public int getLastOrderId() {
		return dbc.getLastOrderId();
	}

	public boolean addOrderedItems(ArrayList<DetalleOrden> orderDetails) {		
		return dbc.addOrderedItems(orderDetails);
	}
        
}
