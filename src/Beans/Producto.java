package Beans;

public class Producto {

    public Producto(String nombreProducto, int idCategoria, int cantidad, String precio) {
        this.nombreProducto = nombreProducto;
        this.idCategoria = idCategoria;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    int idProducto;
    int idCategoria;
    int cantidad;
    String nombreProducto;        
    String precio; 

    public Producto() {
    }


    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", idCategoria=" + idCategoria + ", cantidad=" + cantidad + ", nombreProducto=" + nombreProducto + ", precio=" + precio + '}';
    } 
    
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
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

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

}
