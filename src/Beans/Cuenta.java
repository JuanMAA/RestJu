
package Beans;

public class Cuenta {

    private int idCuenta;
    private int idOrden;
    int totalproductos;
    String costototal;
    String fecha;
    String hora;
    
    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public int getTotalproductos() {
        return totalproductos;
    }

    public void setTotalproductos(int totalproductos) {
        this.totalproductos = totalproductos;
    }

    public String getCostototal() {
        return costototal;
    }

    public void setCostototal(String costototal) {
        this.costototal = costototal;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    @Override
    public String toString() {
	return "Bill { id=" + this.idCuenta + ", orderId=" + this.idOrden
				+ ", totalItem=" + this.totalproductos + ", totalCost="
				+ this.costototal + ", data=" + this.fecha + ", time="
				+ this.hora + "}";
	}

}
