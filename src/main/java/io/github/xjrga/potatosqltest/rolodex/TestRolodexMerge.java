/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.github.xjrga.potatosqltest.rolodex;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Jorge R Garcia de Alba &lt;jorge.r.garciadealba@gmail.com&gt;
 */
public class TestRolodexMerge extends TestTemplate {

    public TestRolodexMerge() {
        super();
        System.out.println(getName());
        super.setSchema("Rolodex");
        super.reset();
        super.run();
    }

    @Override
    public String getName() {
        return "*Merge test*";
    }

    @Override
    public void test() throws SQLException {
        System.out.println("Start testing merge");
        Integer personId = 0;
        Integer addressId = 0;
        this.Person_Merge(personId, "User");
        this.Address_Merge(addressId, "User Address Details");
        long millis = Calendar.getInstance().getTimeInMillis();
        Date date = new Date(millis);
        int addressUsageType = 0;
        this.AddressUsage_Merge(personId, addressId, addressUsageType, date);
        this.Person_Select_All_Print();
        this.Address_Select_All_Print();
        this.AddressUsage_Select_All_Print();
        System.out.println("End testing merge");
        System.out.println("");
    }

    public void Person_Merge(Integer PersonId, String PersonName) throws SQLException {
        CallableStatement proc = connection.prepareCall("{CALL Person_Merge( ?, ? )}");
        proc.setInt(1, PersonId);
        proc.setObject(2, PersonName);
        proc.execute();
        proc.close();
    }

    public List<Map<String, Object>> Person_Select_All() throws SQLException {
        List<Map<String, Object>> list = new LinkedList<>();
        CallableStatement proc;
        proc = connection.prepareCall("{CALL Person_Select_All()}");
        ResultSet rs = proc.executeQuery();
        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            row.put("PERSONID", rs.getObject(1));
            row.put("PERSONNAME", rs.getObject(2));

            list.add(row);
        }
        proc.close();
        return list;
    }

    public void Person_Select_All_Print() throws SQLException {
        List list = (LinkedList) Person_Select_All();
        Iterator it = list.listIterator();
        while (it.hasNext()) {
            Map row = (HashMap) it.next();
            Integer PersonId = (Integer) row.get("PERSONID");
            String PersonName = (String) row.get("PERSONNAME");
            System.out.println(PersonId + "," + PersonName);
        }
    }

    public void Address_Merge(Integer AddressId, String AddressDetail) throws SQLException {
        CallableStatement proc = connection.prepareCall("{CALL Address_Merge( ?, ? )}");
        proc.setInt(1, AddressId);
        proc.setObject(2, AddressDetail);
        proc.execute();
        proc.close();
    }

    public List<Map<String, Object>> Address_Select_All() throws SQLException {
        List<Map<String, Object>> list = new LinkedList<>();
        CallableStatement proc;
        proc = connection.prepareCall("{CALL Address_Select_All()}");
        ResultSet rs = proc.executeQuery();
        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            row.put("ADDRESSID", rs.getObject(1));
            row.put("ADDRESSDETAIL", rs.getObject(2));

            list.add(row);
        }
        proc.close();
        return list;
    }

    public void Address_Select_All_Print() throws SQLException {
        List list = (LinkedList) Address_Select_All();
        Iterator it = list.listIterator();
        while (it.hasNext()) {
            Map row = (HashMap) it.next();
            Integer AddressId = (Integer) row.get("ADDRESSID");
            String AddressDetail = (String) row.get("ADDRESSDETAIL");
            System.out.println(AddressId + "," + AddressDetail);
        }
    }

    public void AddressUsage_Merge(Integer PersonId, Integer AddressId, Integer AddressUsageType, Date AddressUsageStartDate) throws SQLException {
        CallableStatement proc = connection.prepareCall("{CALL AddressUsage_Merge( ?, ?, ?, ? )}");
        proc.setInt(1, PersonId);
        proc.setInt(2, AddressId);
        proc.setInt(3, AddressUsageType);
        proc.setDate(4, AddressUsageStartDate);
        proc.execute();
        proc.close();
    }

    public List<Map<String, Object>> AddressUsage_Select_All() throws SQLException {
        List<Map<String, Object>> list = new LinkedList<>();
        CallableStatement proc;
        proc = connection.prepareCall("{CALL AddressUsage_Select_All()}");
        ResultSet rs = proc.executeQuery();
        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            row.put("PERSONID", rs.getObject(1));
            row.put("ADDRESSID", rs.getObject(2));
            row.put("ADDRESSUSAGETYPE", rs.getObject(3));
            row.put("ADDRESSUSAGESTARTDATE", rs.getObject(4));

            list.add(row);
        }
        proc.close();
        return list;
    }

    public void AddressUsage_Select_All_Print() throws SQLException {
        List list = (LinkedList) AddressUsage_Select_All();
        Iterator it = list.listIterator();
        while (it.hasNext()) {
            Map row = (HashMap) it.next();
            Integer PersonId = (Integer) row.get("PERSONID");
            Integer AddressId = (Integer) row.get("ADDRESSID");
            Integer AddressUsageType = (Integer) row.get("ADDRESSUSAGETYPE");
            Date AddressUsageStartDate = (Date) row.get("ADDRESSUSAGESTARTDATE");
            System.out.println(PersonId + "," + AddressId + "," + AddressUsageType + "," + AddressUsageStartDate);
        }
    }

}
