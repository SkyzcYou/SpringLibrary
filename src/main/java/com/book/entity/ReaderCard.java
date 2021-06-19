package com.book.entity;

import java.io.Serializable;


/**
 * entity-借阅卡
 */

public class ReaderCard implements Serializable{

    private int readerId;
    private String name;
    private String passwd;
    private int cardState;

    public void setCardState(int cardState) {
        this.cardState = cardState;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public void setReaderId(int readerId) {
        this.readerId = readerId;
    }

    public int getReaderId() {
        return readerId;
    }

    public int getCardState() {
        return cardState;
    }

    public String getName() {
        return name;
    }

    public String getPasswd() {
        return passwd;
    }
}
