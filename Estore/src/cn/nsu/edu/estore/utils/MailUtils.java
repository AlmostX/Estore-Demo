package cn.nsu.edu.estore.utils;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {

    public static void sendMail(String email,String emailInfo)
            throws AddressException, MessagingException, GeneralSecurityException {
        Properties prop=new Properties();
        prop.put("mail.host","smtp.163.com" );
        prop.put("mail.transport.protocol", "smtp");
        prop.put("mail.smtp.auth", true);
        //1.����sesssion
        Session session=Session.getInstance(prop);
        //����session�ĵ���ģʽ�����Բ鿴��ǰ�ʼ�����״̬
        session.setDebug(true);

        //2.ͨ��session��ȡTransport���󣨷����ʼ��ĺ���API��
        Transport ts=session.getTransport();
        //3.ͨ���ʼ��û������루��Ȩ�� ������
        ts.connect("17780713604@163.com", "hslzym1314");

        //4.�����ʼ�
        Message msg=createSimpleMail(session,email,emailInfo);

        //5.���͵����ʼ�
        ts.sendMessage(msg, msg.getAllRecipients());
    }
    private static Message createSimpleMail(Session session, String email, String emailInfo) throws AddressException, MessagingException {
        MimeMessage mm=new MimeMessage(session);
        //���÷�����
        mm.setFrom(new InternetAddress("17780713604@163.com"));
        //�����ռ���
        mm.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        mm.setSubject("�����ʼ�");
        mm.setContent(emailInfo, "text/html;charset=gbk");
        return mm;
    }
}

