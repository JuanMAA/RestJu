package Dao;

import java.util.ArrayList;
import Beans.DetalleCuenta;
import Beans.Categoria;
import Beans.Producto;
import Beans.Login;
import Beans.DetalleOrden;
import Beans.Orden;

public class DaoServiciosUsuario
{
    
ConexionBD dbc = new ConexionBD();
	
	public ArrayList<Categoria> getAllCategorys(){
		return dbc.getAllCategory();
	}
	public boolean checkLogin(Login login)
	{
		return  dbc.checkLogin(login);		
	}
	
	public ArrayList<Producto>getAllItems(int catId)
	{
		return dbc.getAllItemsByCategory(catId);
	}
	
	public ArrayList<Orden>getAllOrders(int tableNo){
		return dbc.getAllOrders(tableNo);
	}
	
	public ArrayList<DetalleCuenta> getBill(int tableNo)
	{
		return dbc.getBill(tableNo);
	}
}