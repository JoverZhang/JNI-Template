package com.ttmo;

import com.ttmo.HelloJNI;

public class JNITest{

    static {
        System.loadLibrary("HelloJNI");
        System.loadLibrary("ObjectJNI");
    }

    public static void main(String[] args) {
        String helloWorld = HelloJNI.helloWorld();
        System.out.println(helloWorld);

        ObjectJNI objectJNI = new ObjectJNI();
        objectJNI.setData("object JNI");
        System.out.println(objectJNI.getData());
    }

}
