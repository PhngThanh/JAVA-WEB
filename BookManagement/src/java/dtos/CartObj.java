/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;
import java.util.HashMap;

/**
 *
 * @author hieu
 */
public class CartObj implements Serializable {

    private HashMap<String, CartDTO> cart;

    public float getTotalOrder() {
        float price = 0;
        for (CartDTO dto : this.cart.values()) {
            price += dto.getQuantity() * dto.getPrice();
        }
        return price;
    }


    public CartObj() {
        this.cart = new HashMap<>();
    }

    public void setCart(HashMap<String, CartDTO> cart) {
        this.cart = cart;
    }

    public HashMap<String, CartDTO> getCart() {
        return cart;
    }

    public void add(CartDTO dto) {
        //cái này là kt xem có cái giỏ đựng chưa ?? - chưa thì new 
        if (this.cart == null) {
            cart = new HashMap();
        }

        //cái này là có cái trùng với cái có sẵn
        if (this.cart.containsKey(dto.getBookId())) {
            int quantity = this.cart.get(dto.getBookId()).getQuantity() + 1;
            dto.setQuantity(quantity);
            dto.setTotalUnitPrice(quantity * dto.getPrice());
        }

        //add vô giỏ 
        this.cart.put(dto.getBookId(), dto);

    }

    public void remove(String id) {
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
        if (this.cart.isEmpty()) {
            cart = null;
        }
    }

    public void update(CartDTO dto) {
        if (cart != null) {
            if (cart.containsKey(dto.getBookId())) {
                cart.replace(dto.getBookId(), dto);
            }
        }
    }

    public float getTotal() {
        float total = 0;
        for (CartDTO dto : this.cart.values()) {
            total += dto.getQuantity() * dto.getPrice();
        }
        return total;
    }
}
