package io.github.xjrga.potatosqltest.rolodex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class TestTemplate {

    Connection connection;

    public TestTemplate() {
        this.startConnection();
        if (isConnectionAvailable()) {
            System.out.println("\nThere is a database connection\n");
        } else {
            System.out.println("\nThere is no database connection\n");
        }
    }

    public void run() {
        if (isConnectionAvailable()) {
            try {
                this.turnOffAutocommit();
                this.test();
                //this.turnOnAutocommit();
                this.commit();
            } catch (Exception e) {
                this.rollback();
            } finally {
                //this.shutdown();
            }
        }
    }

    abstract String getName();

    abstract void test() throws SQLException;

    private void startConnection() {
        try {
            Class.forName("org.hsqldb.jdbcDriver");
            //connection = DriverManager.getConnection("jdbc:hsqldb:file:data/database/potatosqltestdb;shutdown=true", "SA", "");
            connection = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost:9002/potatosqltest", "SA", "");
        } catch (ClassNotFoundException | SQLException ex) {
        }
    }

    private void turnOffAutocommit() {
        if (isConnectionAvailable()) {
            try {
                connection.setAutoCommit(false);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void turnOnAutocommit() {
        if (isConnectionAvailable()) {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void commit() {
        if (isConnectionAvailable()) {
            try {
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void close() {
        if (isConnectionAvailable()) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void shutdown() {
        if (isConnectionAvailable()) {
            String sql = "SHUTDOWN COMPACT;";
            Statement stmt;
            try {
                stmt = connection.createStatement();
                stmt.executeUpdate(sql);
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void reset() {

        //DROP SCHEMA PUBLIC CASCADE - clear all data and drop all tables
        //TRUNCATE SCHEMA PUBLIC AND COMMIT - clear all data and keep tables
        //? TRUNCATE SCHEMA PUBLIC AND COMMIT NO CHECK - clear all data, keep tables, bypass referential integrity
        //Not working for me -> TRUNCATE SCHEMA PUBLIC RESTART IDENTITY AND COMMIT NO CHECK - clear all data, restart identities, keep tables, bypass referential integrity
        String sql = "TRUNCATE SCHEMA ROLODEX AND COMMIT;";
        Statement stmt;
        if (isConnectionAvailable()) {
            try {
                stmt = connection.createStatement();
                stmt.executeUpdate(sql);
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void rollback() {
        if (isConnectionAvailable()) {
            try {
                connection.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void setSchema(String schemaName) {
        StringBuilder sb = new StringBuilder();
        sb.append("SET SCHEMA");
        sb.append(" ");
        sb.append(schemaName);
        sb.append(";");
        String sql = sb.toString();
        Statement stmt;
        if (isConnectionAvailable()) {
            try {
                stmt = connection.createStatement();
                stmt.executeUpdate(sql);
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private boolean isConnectionAvailable() {
        boolean isAvailable = false;
        boolean isNull = connection == null;
        boolean isValid = false;
        if (!isNull) {
            try {
                isValid = connection.isValid(1);
            } catch (SQLException ex) {
            }
        }
        if (!isNull && isValid) {
            isAvailable = true;
        }
        return isAvailable;
    }

}
