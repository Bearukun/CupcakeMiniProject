/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Cupcake {
    
    private int idCupcake;
    private String cupCakename;
    private int idTopping;
    private int idBottom;

    //Used to create a new cupcake from the site
    public Cupcake(String cupCakename, int idTopping, int idBottom) {
        this.cupCakename = cupCakename;
        this.idTopping = idTopping;
        this.idBottom = idBottom;
    }

    //Used when pulling data from mysql to local ArrayList
    public Cupcake(int idCupcake, String cupCakename, int idTopping, int idBottom) {
        this.idCupcake = idCupcake;
        this.cupCakename = cupCakename;
        this.idTopping = idTopping;
        this.idBottom = idBottom;
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

    @Override
    public String toString() {
        return "Cupcake{" + "idCupcake=" + idCupcake + ", cupCakename=" + cupCakename + ", idTopping=" + idTopping + ", idBottom=" + idBottom + '}';
    }
    
    
}
