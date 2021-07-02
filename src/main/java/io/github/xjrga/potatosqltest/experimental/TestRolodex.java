package io.github.xjrga.potatosqltest.experimental;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

public class TestRolodex {

    public TestRolodex() {
    }

    public static void main(String[] args) throws Exception {
        TestRolodex testRolodex1 = new TestRolodex();
        testRolodex1.test();
    }

    public void test() throws Exception {

        Connection conn;
        Statement stmnt;
        PreparedStatement pstmnt;

        Class.forName("org.hsqldb.jdbc.JDBCDriver");

        conn = DriverManager.getConnection("jdbc:hsqldb:mem:test", "sa", "");
        stmnt = conn.createStatement();
        loadSchema(conn);
        System.out.println("");
        loadProcedures(conn);
    }

    private void loadSchema(Connection conn) throws SQLException {
        PreparedStatement pstmnt;
        File dir = new File("data/sql/test/schema");
        FilenameFilter filter = new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith("sql");
            }
        };
        String[] files = dir.list(filter);
        Arrays.sort(files);
        for (int i = 0; i < files.length; i++) {
            String fileName = dir.getAbsolutePath() + File.separatorChar + files[i];
            System.out.println(fileName);
            File file = new File(fileName);
            String sql = this.readFile(file);
            System.out.println(sql);
            pstmnt = conn.prepareStatement(sql);
            pstmnt.executeUpdate();
            pstmnt.close();
        }
    }

    private void loadProcedures(Connection conn) throws SQLException {
        File dir = new File("data/sql/test/procedures");
        FilenameFilter filter = new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith("sql");
            }
        };
        String[] files = dir.list(filter);
        Arrays.sort(files);
        for (int i = 0; i < files.length; i++) {
            Statement st = conn.createStatement();
            String fileName = dir.getAbsolutePath() + File.separatorChar + files[i];
            System.out.println(fileName);
            File file = new File(fileName);
            String sql = this.readFile(file);
            System.out.println(sql);
            st.execute(sql);
            st.close();
        }
    }

    private String readFile(File file) {
        StringBuilder sb = new StringBuilder();
        try {

            BufferedReader in = new BufferedReader(new FileReader(file));
            String str = "";
            while ((str = in.readLine()) != null) {
                sb.append(str);
            }
        } catch (IOException ex) {

        }
        return sb.toString();
    }
}
