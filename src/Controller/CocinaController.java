package Controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Beans.Producto;
import Beans.DetalleOrden;
import Beans.Orden;
import Constantes.Constantes;
import Dao.DaoServicioCocina;

public class CocinaController extends BaseController {

        private static final long serialVersionUID = -4843668254577645314L;
	DaoServicioCocina cService = new DaoServicioCocina();

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		doPostAction(action, request, response);
	}

	public void doPostAction(String action, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String contextPath = request.getContextPath() + "/";
			if (action.equals("addCategory")) {
				String name = request.getParameter("cate");
				if (!cService.isAlreadyExists(name)) {
					if (cService.addCategory(name)) {
						Constantes.MENSAJE = String.format(Constantes.AGREGADO_EXITOSAMENTE, name);
					} else {
						Constantes.MENSAJE = String.format(Constantes.AGREGADO_ERROR, name);
					}
				} else {
					Constantes.MENSAJE=String.format(Constantes.ERROR_CATEGORIA, name);
				}
				Constantes.JSP_PAGE = contextPath + "AgregarCategoria.jsp";
				response.sendRedirect(Constantes.JSP_PAGE);

			} else if (action.equals("addItem")) {
				Producto p = new Producto(request.getParameter("itemName"),
						Integer.parseInt(request.getParameter("categoryId")),
						Integer.parseInt(request.getParameter("qnt")),
						request.getParameter("cost"));

				System.out.println(p);
				if (!cService.isItemAlreadyExists(p.getNombreProducto())) {
					if (cService.addItem(p)) {
						Constantes.MENSAJE = String.format(Constantes.AGREGADO_EXITOSAMENTE, p.getNombreProducto());
					} else {
						Constantes.MENSAJE = String.format(Constantes.AGREGADO_ERROR, p.getNombreProducto());
					}
				} else {
					Constantes.MENSAJE = String.format(Constantes.ERROR_CATEGORIA, p.getNombreProducto());
				}
				Constantes.JSP_PAGE = contextPath + "AgregarProducto.jsp";
				response.sendRedirect(Constantes.JSP_PAGE);
			}
			else if(action.equals("updateOStatus"))
			{
				int orderId = Integer.parseInt(request.getParameter("orderId"));
				String status = request.getParameter("status");
				if(cService.updateOrderStatus(orderId, status))
				{
					Constantes.MENSAJE = Constantes.ACTUALIZACION_COMPLETA;
				}
				else
				{
					Constantes.MENSAJE = Constantes.ERROR_ACTUALIZACION;
				}
				Constantes.JSP_PAGE = contextPath+"Orden.jsp";
				response.sendRedirect(Constantes.JSP_PAGE);
			}
			else if(action.equals("updateItemtatus"))
			{
				int orderId = Integer.parseInt(request.getParameter("idOrden"));
				int itemId = Integer.parseInt(request.getParameter("idProducto"));
				String status = request.getParameter("estado");
				System.out.println("idOrden = "+orderId+ " idProducto = "+itemId+" estado ="+status);
				if(cService.updateItemStatus(orderId, itemId, status))
				{
					Constantes.MENSAJE = Constantes.ACTUALIZACION_COMPLETA;
				}
				else
				{
					Constantes.MENSAJE = Constantes.ERROR_ACTUALIZACION;
				}
				Constantes.JSP_PAGE = contextPath+"OrdenProducto.jsp";
				response.sendRedirect(Constantes.JSP_PAGE);
			}
			else if(action.equals("makeOrder"))
			{
				String itemId[] = request.getParameterValues("idProducto");
				String qnt[] = request.getParameterValues("cantidad");
				int catId = Integer.parseInt(request.getParameter("idCategoria"));
				String orderName = request.getParameter("aNombreDe");
				int tableNo = Integer.parseInt(request.getParameter("numeroMesa"));
				String status = request.getParameter("estadoOrden");
				
				Orden ord = new Orden();
				ord.setaNombreDe(orderName);
				ord.setEstorden(Orden.getOrderStat(status));
				ord.setNumeroMesa(tableNo);
				if(itemId != null && qnt != null)
				{
					if(cService.addOrder(ord))
					{
						int orderId = cService.getLastOrderId();
					
						ArrayList<DetalleOrden> orderDetails = new ArrayList<DetalleOrden>();
						DetalleOrden od = new DetalleOrden();
						
						for(int i=0;i<itemId.length;i++)
						{
							od.setIdOrden(orderId);
							od.setIdProducto(Integer.parseInt(itemId[i]));
							od.setCantidad(Integer.parseInt(qnt[i]));
							od.setEstorden(DetalleOrden.getOrderStat(DetalleOrden.EstadoOrden.EN_PROSESO.name()));
							orderDetails.add(od);
						}
						if(cService.addOrderedItems(orderDetails))
						{
							Constantes.MENSAJE = "Oreden correcta";
						}
						else
						{
							Constantes.MENSAJE = "Error en la orden"
                                                                + "";
						}
					}
					else
					{
						Constantes.MENSAJE = "Error en orden";
					}
				}
				else
				{
					Constantes.MENSAJE = "Elija una opcion valida";
				}
				
				Constantes.JSP_PAGE = contextPath+"Productos.jsp?catId="+catId;				
				response.sendRedirect(Constantes.JSP_PAGE);
			}

		} catch (Exception e) {
			System.out.println("Error en controlador " + e);
		}
	}
}
