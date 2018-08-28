package Beans;

public class Orden {

    int idOrden;	
    int numeroMesa;
    String fecha;
    String hora;
    String aNombreDe;
    
    public EstadoOrden estorden;    
    public enum EstadoOrden {
        EN_ESPERA, 
        PREPARANDOSE, 
        PEDIDO_LISTO, 
        PEDIDO_ENTREGADO }
    
    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public int getNumeroMesa() {
        return numeroMesa;
    }

    public void setNumeroMesa(int numeroMes) {
        this.numeroMesa = numeroMes;
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

    public String getaNombreDe() {
        return aNombreDe;
    }

    public void setaNombreDe(String aNombreDe) {
        this.aNombreDe = aNombreDe;
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
