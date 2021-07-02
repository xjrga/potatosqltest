/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.github.xjrga.potatosqltest.rolodex;

/**
 *
 * @author Jorge R Garcia de Alba &lt;jorge.r.garciadealba@gmail.com&gt;
 */
public class RunTests {

    public RunTests(){
        TestRolodexInsert testRolodexInsert = new TestRolodexInsert();
        TestRolodexUpdate testRolodexUpdate = new TestRolodexUpdate();
        TestRolodexDeleteUser testRolodexDeleteUser = new TestRolodexDeleteUser();
        TestRolodexDeleteAddress testRolodexDeleteAddress = new TestRolodexDeleteAddress();
        TestRolodexMerge testRolodexMerge = new TestRolodexMerge();
        TestRolodexDeleteAll testRolodexDeleteAll = new TestRolodexDeleteAll();
    }

    public static void main(String[] args) {
        RunTests runTests = new RunTests();
    }

}
