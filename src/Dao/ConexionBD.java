package Dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import Beans.DetalleCuenta;
import Beans.Categoria;
import Beans.Producto;
import Beans.Login;
import Beans.DetalleOrden;
import Beans.Orden;
import Beans.Orden.EstadoOrden;
    
public class ConexionBD {
    
	private static Connection connection = null;
	private static final String NOMBRE_DRIVER = "com.mysql.jdbc.Driver";
	private static final String NOMBRE_BD = "hj";
	private static final String BD_URL = "jdbc:mysql://localhost:3306/" + ConexionBD.NOMBRE_BD;
	private static final String ROOT = "root";
	private static final String CONTRASEÑA = "";

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(NOMBRE_DRIVER);
			con = (Connection) DriverManager.getConnection(BD_URL, ROOT,
					CONTRASEÑA);
			return con;
		} catch (ClassNotFoundException cne) {
			System.out.println(cne);
		} catch (SQLException sqle) {
			System.out.println(sqle.toString());
		}
		return con;
	}

	public void closeConnection() {
		try {
			if (connection != null)
				connection.close();
		} catch (SQLException sqle) {
			System.out.println(sqle.toString());
		}
	}

	public boolean checkLogin(Login login) {
		String SQL = "select usuario,contrasena from login where usuario='"
				+ login.getUsuario() + "' and contrasena='" + login.getContrasena()
				+ "'";
		connection = getConnection();
		boolean result = Boolean.FALSE;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				if (rs.next())
					result = Boolean.TRUE;
				else
					result = Boolean.FALSE;
				closeConnection();
			} else {
				System.out.println("Connection checkLogin");
			}
		} catch (SQLException sqle) {
			System.out.println("sqle in checkLogin - " + sqle);
		}
		return result;
	}

	public boolean isAlreadyExists(String name) {
		String SQL = "select nombreCategoria from categoria where nombreCategoria='" + name + "'";
		connection = getConnection();
		boolean result = Boolean.FALSE;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				if (rs.next())
					result = Boolean.TRUE;

				closeConnection();
			} else {
				System.out.println("Connection is null in isAlreadyExists");
			}
		} catch (SQLException sqle) {
			System.out.println("sqle in isAlreadyExists - " + sqle);
		}
		return result;
	}

	public boolean addCategory(String name) {
		String SQL = "insert into categoria(nombreCategoria) values('" + name + "')";
		connection = getConnection();
		boolean result = Boolean.FALSE;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				int update = st.executeUpdate(SQL);
				if (update > 0)
					result = Boolean.TRUE;

				closeConnection();
			} else {
				System.out.println("Connection is null");
			}
		} catch (SQLException sqle) {
			System.out.println("sqle" + sqle);
		}
		return result;

	}

	public boolean isItemAlreadyExists(String itemName) {
		String SQL = "select nombreProducto from producto where nombreProducto='" + itemName + "'";
		connection = getConnection();
		boolean result = Boolean.FALSE;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				if (rs.next())
					result = Boolean.TRUE;

				closeConnection();
			} else {
				System.out.println("Connection is null");
			}
		} catch (SQLException sqle) {
			System.out.println("sqle" + sqle);
		}
		return result;
	}

	public boolean addItem(Producto pd) {
		String SQL = "insert into producto(nombreProducto, idCategoria, cantidad, precio) values('"
				+ pd.getNombreProducto() + "', " + pd.getIdCategoria() + ", "
				+ pd.getCantidad() + ", '" + pd.getPrecio() + "')";
		connection = getConnection();
		boolean result = Boolean.FALSE;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				int update = st.executeUpdate(SQL);
				if (update > 0)
					result = Boolean.TRUE;

				closeConnection();
			} else {
				System.out.println("Connection is null");
			}
		} catch (SQLException sqle) {
			System.out.println("sqle" + sqle);
		}
		return result;

	}
        
	public ArrayList<Categoria> getAllCategory() {
		String SQL = "select * from categoria";
		ArrayList<Categoria> cats = new ArrayList<Categoria>();
		Categoria c = null;
		try {
			connection = getConnection();
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				while (rs.next()) {
					c = new Categoria();
					c.setIdCategoria(rs.getInt("idCategoria"));
					c.setNombreCategoria(rs.getString("nombreCategoria"));
					cats.add(c);
				}
				closeConnection();
			} else {
				System.out.println("connection is null");
			}
		} catch (Exception e) {
			System.out.println("sqle" + e);
		}
		return cats;
	}

	public ArrayList<Orden> getAllOrders() {
		String SQL = "select * from orden where estadoOrden !='"
				+ EstadoOrden.PEDIDO_LISTO.name() + "' and fecha = curdate()";
		ArrayList<Orden> os = new ArrayList<Orden>();
		Orden om = null;
		try {
			connection = getConnection();
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				while (rs.next()) {
					om = new Orden();
					om.setIdOrden(rs.getInt("idOrden"));
					om.setNumeroMesa(rs.getInt("numeroMesa"));
					om.setaNombreDe(rs.getString("aNombreDe"));
					om.setFecha(rs.getDate("fecha").toString());
					om.setFecha(rs.getString("hora"));
					om.setEstorden(Orden.getOrderStat(rs
							.getString("estadoOrden")));

					os.add(om);
				}
				closeConnection();
			} else {
				System.out.println("connection is null");
			}
		} catch (Exception e) {
			System.out.println("sqle" + e);
		}
		return os;
	}

	public boolean updateOrderStatus(int orderId, String status) {
		String SQL = "update orden set estadoOrden='" + status
				+ "' where idOrden=" + orderId;
		connection = getConnection();
		boolean result = Boolean.FALSE;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				int update = st.executeUpdate(SQL);
				if (update > 0)
					result = Boolean.TRUE;

				closeConnection();
			} else {
				System.out.println("Connection is null in updateOrderStatus");
			}
		} catch (SQLException sqle) {
			System.out.println("sqle" + sqle);
		}
		return result;
	}

	public ArrayList<DetalleOrden> getAllItems(int orderId) {
		String SQL = "SELECT orden.idOrden, numeroMesa, producto.idProducto, producto.nombreProducto, producto.cantidad, producto.precio, detalleorden.estado"
				+ " FROM orden,detalleorden, producto"
				+ " WHERE orden.idOrden = detalleorden.idOrden and detalleorden.idProducto = producto.idProducto and orden.idOrden="
				+ orderId;
		ArrayList<DetalleOrden> ods = new ArrayList<DetalleOrden>();
		DetalleOrden od = null;
		try {
			connection = getConnection();
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				while (rs.next()) {
					od = new DetalleOrden();
					od.setIdDetalleOrden(rs.getInt("orden.idOrden"));
					od.setNumeroMesa(rs.getInt("numeroMesa"));
					od.setIdProducto(rs.getInt("producto.idProducto"));
					od.setNombreProducto(rs.getString("producto.nombreProducto"));
					od.setCantidad(rs.getInt("producto.cantidad"));
					od.setCostoProducto(rs.getString("producto.precio"));
					od.setEstorden(DetalleOrden.getOrderStat(rs
							.getString("detalleorden.estado")));
					ods.add(od);
				}
				closeConnection();
			} else {
				System.out.println("connection is null");
			}
		} catch (Exception e) {
			System.out.println("sqle" + e);
		}
		return ods;
	}

	public boolean updateItemStatus(int orderId, int itemId, String status) {
		String SQL = "UPDATE detalleorden SET estado='" + status
				+ "' where idOrden=" + orderId + " and idProducto=" + itemId;
		connection = getConnection();
		boolean result = Boolean.FALSE;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				int update = st.executeUpdate(SQL);
				if (update > 0)
					result = Boolean.TRUE;

				closeConnection();
			} else {
				System.out.println("Connection is null");
			}
		} catch (SQLException sqle) {
			System.out.println("sqle" + sqle);
		}
		return result;
	}

	public ArrayList<Producto> getAllItemsByCategory(int catId) {
		String SQL = "SELECT * FROM producto where idCategoria=" + catId;
		ArrayList<Producto> items = new ArrayList<Producto>();
		Producto i = null;
		try {
			connection = getConnection();
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				while (rs.next()) {
					i = new Producto();
					i.setIdProducto(rs.getInt("idProducto"));
					i.setIdCategoria(rs.getInt("idCategoria"));
					i.setNombreProducto(rs.getString("nombreProducto"));
					i.setCantidad(rs.getInt("cantidad"));
					i.setPrecio(rs.getString("precio"));
					items.add(i);
				}
				closeConnection();
			} else {
				System.out.println("connection is null");
			}
		} catch (Exception e) {
			System.out.println("sqle" + e);
		}
		return items;
	}

	public ArrayList<Orden> getAllOrders(int tableNo) {
		String SQL = "SELECT * FROM orden where fechaOrden = curdate() and numeroMesa="
				+ tableNo;
		ArrayList<Orden> os = new ArrayList<Orden>();
		Orden om = null;
		try {
			connection = getConnection();
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				while (rs.next()) {
					om = new Orden();
					om.setIdOrden(rs.getInt("idOrden"));
					om.setNumeroMesa(rs.getInt("numeroMesa"));
					om.setaNombreDe(rs.getString("aNombreDe"));
					om.setFecha(rs.getDate("fecha").toString());
					om.setFecha(rs.getString("hora"));
					om.setEstorden(Orden.getOrderStat(rs
							.getString("EstadoOrden")));

					os.add(om);
				}
				closeConnection();
			} else {
				System.out.println("connection is null");
			}   
		} catch (Exception e) {
			System.out.println("sqle" + e);
		}
		return os;
	}

	public boolean addOrder(Orden orden) {
		String SQL = "INSERT INTO orden(numeroMesa, aNombreDe, fecha, hora, estadoOrden) "
				+ "VALUES("
				+ orden.getNumeroMesa()
				+ ", '"
				+ orden.getaNombreDe()
				+ "', CURDATE(), CURTIME(), '"
				+ orden.getEstorden().name() + "' )";
		connection = getConnection();
		boolean result = Boolean.FALSE;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				int update = st.executeUpdate(SQL);
				if (update > 0)
					result = Boolean.TRUE;

				closeConnection();
			} else {
				System.out.println("Connection is null");
			}
		} catch (SQLException sqle) {
			System.out.println("sqle" + sqle);
		}
		return result;
	}

	public int getLastOrderId() {
		String SQL = "select * from orden";
		connection = getConnection();
		int orderId = 0;
		try {
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				while (rs.next())
					orderId = rs.getInt("idOrden");
			} else {
				System.out.println("Connection is null");
			}
		} catch (Exception e) {
			System.out.println("Error " + e);
		}
		return orderId;
	}

	public boolean addOrderedItems(ArrayList<DetalleOrden> orderDetails) {
		for (DetalleOrden ods : orderDetails) {
			if (!addOrderItem(ods))
				return false;
		}
		return true;
	}

	public boolean addOrderItem(DetalleOrden d) {
		String SQL = "INSERT INTO detalleorden(idOrden, idProducto, cantidad, estado) "
				+ "VALUES("
				+ d.getIdOrden()
				+ ", "
				+ d.getIdProducto()
				+ ", "
				+ d.getCantidad() + ", '" + d.getEstorden().name() + "')";

		boolean result = Boolean.FALSE;
		try {
			connection = getConnection();
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				int update = st.executeUpdate(SQL);
				if (update > 0)
					result = Boolean.TRUE;
			} else {
				System.out.println("connection is null");
			}
		} catch (Exception e) {
			System.out.println("Error " + e);
		}
		return result;
	}

	public ArrayList<DetalleCuenta> getBill(int tableNo) {
		String SQL = "SELECT detalleorden.idOrden, orden.aNombreDe, producto.nombreProducto, producto.cantidad, detalleorden.cantidad, producto.precio"+
					" FROM detalleorden,orden,producto"+
					" where detalleorden.idOrden = orden.idOrden and"+
					" producto.idProducto = detalleorden.idProducto"+
					" and fecha = curdate() and orden.numeroMesa="+tableNo;	
		ArrayList<DetalleCuenta> bdetails = new ArrayList<DetalleCuenta>();		
		try {
			connection = getConnection();
			if (connection != null) {
				Statement st = (Statement) connection.createStatement();
				ResultSet rs = st.executeQuery(SQL);
				while(rs.next())
				{
					DetalleCuenta bd = new DetalleCuenta();
					bd.setId(rs.getInt("detalleorden.idOrden"));
					bd.setOrderId(rs.getInt("detalleorden.idOrden"));
					bd.setOrderName(rs.getString("orden.aNombreDe"));
					bd.setItemName(rs.getString("producto.nombreProducto"));
					bd.setItemQnt(rs.getInt("producto.cantidad"));
					bd.setOrderQnt(rs.getInt("detalleorden.cantidad"));
					bd.setItemCost(rs.getString("producto.precio"));
					bdetails.add(bd);
					
				}
			} else {
				System.out.println("connection is null");
			}
		} catch (Exception e) {
			System.out.println("Error " + e);
		}
		return bdetails;
	}
}
