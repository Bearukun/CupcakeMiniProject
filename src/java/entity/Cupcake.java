package entity;

import java.io.Serializable;

public class Cupcake  implements Serializable {
    
    private int idCupcake;
    private String cupCakename;
    private int idTopping;
    private int idBottom;
    private int qty;


    //Used when pulling data from mysql to local ArrayList
    public Cupcake(int idCupcake, String cupCakename, int idTopping, int idBottom) {
        this.idCupcake = idCupcake;
        this.cupCakename = cupCakename;
        this.idTopping = idTopping;
        this.idBottom = idBottom;
        this.qty = 1;
    }
    
    //Used when adding Cupcakes to the basket

    public Cupcake(int idCupcake, String cupCakename, int idTopping, int idBottom, int qty) {
        this.idCupcake = idCupcake;
        this.cupCakename = cupCakename;
        this.idTopping = idTopping;
        this.idBottom = idBottom;
        this.qty = qty;
    }
    
    
    

    public int getIdCupcake() {
        return idCupcake;
    }

    public void setIdCupcake(int idCupcake) {
        this.idCupcake = idCupcake;
    }

    public String getCupCakename() {
        return cupCakename;
    }

    public void setCupCakename(String cupCakename) {
        this.cupCakename = cupCakename;
    }

    public int getIdTopping() {
        return idTopping;
    }

    public void setIdTopping(int idTopping) {
        this.idTopping = idTopping;
    }

    public int getIdBottom() {
        return idBottom;
    }

    public void setIdBottom(int idBottom) {
        this.idBottom = idBottom;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }


    
}
