package Controller;

import javax.servlet.http.*;

import Beans.Login;
import Constantes.Constantes;
import Dao.DaoServiciosUsuario;

public class BaseController extends HttpServlet {
	private static final long serialVersionUID = 4481510681863866579L;
	private DaoServiciosUsuario userServices = new DaoServiciosUsuario();	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			String action = request.getParameter("action");
			doPostAction(action, request, response);
		} catch (Exception e) {
			System.out.println("Error in Input Output " + e);
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			String action = request.getParameter("action");
			doGetAction(action, request, response);
		} catch (Exception e) {
			System.out.println("Error in Input Output " + e);
		}
	}
	
	public void doPostAction(String action, HttpServletRequest request,
			HttpServletResponse response) {		
		try {
			action = action.toLowerCase();
			if (action.equals("login")) {
				Login login = new Login();
				login.setUsuario(request.getParameter("nombreUsuario"));
				login.setContrasena(request.getParameter("contra"));

				if (userServices.checkLogin(login)) {					
					HttpSession session = request.getSession();
					System.out.println(login);
					session.setAttribute(Constantes.USUARIO, login);
					Constantes.JSP_PAGE = "Bienvenido.jsp";
				} else {
					Constantes.MENSAJE = Constantes.ERROR_INGRESO;
					Constantes.JSP_PAGE = "Login.jsp";
				}
				response.sendRedirect(Constantes.JSP_PAGE);
			}
		} catch (Exception e) {
			System.out.println("Error in doPostAction() " + e);
			e.printStackTrace();
		}
	}

	public void doGetAction(String action, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("action in doGet " + action);
		} catch (Exception e) {
			System.out.println("Error in doGetAction - " + e);
		}

	}
}