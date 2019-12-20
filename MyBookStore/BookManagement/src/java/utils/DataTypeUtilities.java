/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author Admin
 */
public class DataTypeUtilities {
    public static int convertStringToInt(String number) {
        try {
            int d = Integer.parseInt(number);
            return d;
        } catch (NumberFormatException e) {
            return -1;
        }
    }
    public static float convertStringToFloat(String number) {
        try {
            float d = Float.parseFloat(number);
            return d;
        } catch (NumberFormatException e) {
            return -1;
        }
    }
}

