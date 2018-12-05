package br.com.fatecesiii.core.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConvertDate {

	public static String converteDateString(Date dtData) {  

		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		
		return (formato.format(dtData)); 
	} 
		
	public static Date converteStringDate(String data) {   
		
        if (data == null || data.equals(""))  
            return null;  

        Date date = null;  
        
        try {
        	
        	DateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
	        date = (java.util.Date)formatador.parse(data);  
	        
	        return date;
        } catch (ParseException e) {   
        	
            e.printStackTrace();
        }  
        
        return null;
	}
}
