package com.weekstore.model;

import com.weekstore.dto.Custom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    String key = "%02x";

    public int addCustom(Custom user) {
        int cnt = 0;
        DBConnect con = new PostgreCon();
        try {
            conn = con.connect();
            System.out.println(user.toString());
            pstmt = conn.prepareStatement(DBConnect.CUSTOM_INSERT);
            pstmt.setString(1,user.getId());
            pstmt.setString(2,user.getPw());
            pstmt.setString(3,user.getName());
            pstmt.setString(4,user.getTel());
            pstmt.setString(5,user.getEmail());
            pstmt.setString(6,user.getBirth());
            pstmt.setString(7,user.getAddress1());
            pstmt.setString(8,user.getAddress2());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }
    public boolean idCheck(String id){
        Custom cus = new Custom();
        DBConnect con = new PostgreCon();
        boolean pass = false;
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.CUSTOM_SELECT_ONE);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                pass = false;
            } else {
                pass = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return pass;
    }
}