package cn.nsu.edu.estore.domain;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

/**
 * �û���
 */
public class User {
    private int id; // �û����
    private String username; // �û���
    private String password; // ����
    private String email; // ����
    private String role; // ��ɫ   Ĭ����user
    private int state; // �Ƿ񼤻�  0 δ����
    private String activecode; // ������  UUID��ȡ
    private Timestamp updatetime; // ����ʱ��

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getActivecode() {
        return activecode;
    }

    public void setActivecode(String activecode) {
        this.activecode = activecode;
    }

    public Timestamp getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Timestamp updatetime) {
        this.updatetime = updatetime;
    }
    /**
     * ���û�������зǿ���֤
     * @return 	����û���������Ϊ�գ��׳��û���������Ϊ�ռ���
     */
    public Map<String, String> validation() {
        Map<String, String> map = new HashMap<String, String>();
        if (username == null || username.trim().length() == 0) {
            map.put("regist.username.error", "�û�������Ϊ��");
        }
        if (password == null || password.trim().length() == 0) {
            map.put("regist.password.error", "���벻��Ϊ��");
        }
        return map;
    }

}
