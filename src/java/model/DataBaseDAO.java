package model;

import java.sql.Connection;
import java.sql.DriverManager;

abstract class DataBaseDAO {

    Connection conn;

    public void conectar() throws Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bomgosto";
            String user = "root";
            String pass = "";
            conn = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {/*
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bomgosto";
            String user = "root";
            //senha para o Debian = prog 
            String pass = "prog";
            conn = DriverManager.getConnection(url, user, pass);*/
        }
    }

    public void desconectar() throws Exception {
        if (!conn.isClosed()) {
            conn.close();
        }
    }
}
