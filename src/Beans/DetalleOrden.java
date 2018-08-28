package Beans;

public class DetalleOrden {

    int idDetalleOrden;
    int idOrden;
    int numeroMesa;
    int idProducto;
    int cantidad;
    String nombreProducto;
    String costoProducto;    
    public EstadoOrden estorden; 
    
    public enum EstadoOrden { 
            RECIEN_COMENZADA, 
            EN_PROSESO, 
            LISTO }
    
    @Override
    public String toString() {
        return "DetalleOrden{" + "idDetalleOrden=" + idDetalleOrden + ", idOrden=" + idOrden + ", numeroMesa=" + numeroMesa + ", idProducto=" + idProducto + ", cantidad=" + cantidad + ", nombreProducto=" + nombreProducto + ", costoProducto=" + costoProducto + ", estorden=" + estorden + '}';
    }

    public int getIdDetalleOrden() {
        return idDetalleOrden;
    }

    public void setIdDetalleOrden(int idDetalleOrden) {
        this.idDetalleOrden = idDetalleOrden;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public int getNumeroMesa() {
        return numeroMesa;
    }

    public void setNumeroMesa(int numeroMesa) {
        this.numeroMesa = numeroMesa;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getCostoProducto() {
        return costoProducto;
    }

    public void setCostoProducto(String costoProducto) {
        this.costoProducto = costoProducto;
    }

    public EstadoOrden getEstorden() {
        return estorden;
    }

    public void setEstorden(EstadoOrden estorden) {
        this.estorden = estorden;
    }
	
    public  static EstadoOrden getOrderStat(String OrdEsta) {
	for(EstadoOrden os : EstadoOrden.values())
            {
            if(os.name().equals(OrdEsta))
                    return os;
            }
	return null;
    }
}
