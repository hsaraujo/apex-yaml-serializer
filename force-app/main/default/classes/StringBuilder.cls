/**
 * Created by Heitor Araujo on 11/02/20.
 */

public with sharing class StringBuilder {

    private String finalValue;

    public StringBuilder(){
        this.finalValue = '';
    }

    public StringBuilder append(String str){
//        finalValue = String.format('{0}{1}', new List<String>{finalValue, str});
        finalValue += str;
        return this;
    }

    public StringBuilder append(Object obj){
        finalValue += String.valueOf(obj);
        return this;
    }

    public String build(){
        System.debug(finalValue);
        return finalValue;
    }

}