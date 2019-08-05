package cn.nsu.edu.estore.domain;

import java.sql.Timestamp;

public class Order {


    private int id; // ������
    private double money; // ���
    private String receiverinfo; // �ջ�����Ϣ
    private int paystate; // ֧��״̬
    private Timestamp ordertime; // �µ�ʱ��
    private int user_id; // �µ��û�

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public double getMoney() {
        return money;
    }
    public void setMoney(double money) {
        this.money = money;
    }
    public String getReceiverinfo() {
        return receiverinfo;
    }
    public void setReceiverinfo(String receiverinfo) {
        this.receiverinfo = receiverinfo;
    }
    public int getPaystate() {
        return paystate;
    }
    public void setPaystate(int paystate) {
        this.paystate = paystate;
    }
    public Timestamp getOrdertime() {
        return ordertime;
    }
    public void setOrdertime(Timestamp ordertime) {
        this.ordertime = ordertime;
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public Order() {
    }

}
