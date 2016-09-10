/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;

public class Layer  implements Serializable{

    private int idTopping;
    private String cupcakeLayerPiece;
    private int price;

    public Layer(int idTopping, String cupcakeToppingPiece, int price) {
        this.idTopping = idTopping;
        this.cupcakeLayerPiece = cupcakeToppingPiece;
        this.price = price;
    }

    public int getIdTopping() {
        return idTopping;
    }

    public void setIdTopping(int idTopping) {
        this.idTopping = idTopping;
    }

    public String getCupcakeLayerPiece() {
        return cupcakeLayerPiece;
    }

    public void setCupcakeLayerPiece(String cupcakeLayerPiece) {
        this.cupcakeLayerPiece = cupcakeLayerPiece;
    }


    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Topping{" + "idTopping=" + idTopping + ", cupcakeToppingPiece=" + cupcakeLayerPiece + ", price=" + price + '}';
    }

}
