/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tecfarma.dao;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import com.tecfarma.dao.constants.DaoConstants;
import com.tecfarma.dao.utils.DaoUtils;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author josmarl
 */
public class ConnDatabase {

    public PreparedStatement ps;
    public ResultSet rs;
    public ResultSetMetaData rsmd;
    public Connection oConnection;

    public void openConn() {

        try {

            Properties db = DaoUtils.readProperties(new File(DaoConstants.FILE_CONEXION));

            String url = db.getProperty("MYSQL_DB_URL");
            String user = db.getProperty("MYSQL_DB_USERNAME");
            String password = db.getProperty("MYSQL_DB_PASSWORD");

            MysqlDataSource mysqlDataSouce = new MysqlDataSource();
            mysqlDataSouce.setURL(url);
            mysqlDataSouce.setUser(user);
            mysqlDataSouce.setPassword(password);
            
            DataSource dataSource = mysqlDataSouce;
            oConnection = dataSource.getConnection();

        } catch (Exception e) {
            Logger.getLogger(ConnDatabase.class.getName()).log(Level.SEVERE, e.getMessage());
        }
    }

    public void closeConn() {
        
        try {
            if (oConnection != null) {
                oConnection.close();
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            }

            Logger.getLogger(ConnDatabase.class.getName()).log(Level.INFO, DaoConstants.MSG_CONN_CLOSE_SUCESS);

        } catch (SQLException ex) {
            Logger.getLogger(ConnDatabase.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
}
