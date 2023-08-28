package com.weekstore.model;
import java.sql.*;

public interface DBConnect {
    final static String CUSTOM_INSERT = "insert into custom values(?,?,?,default,default,?,?,?,default,?,?)";
    final static String CUSTOM_SELECT_ONE = "select * from custom where id=?";
    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);
}
