package cn.nsu.edu.estore.utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.IOUtils;
/*
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
*/
public class UploadPic {

    private static String path = "c:\\upload";

    //�ϴ�ͼƬ
    public static void savePic(FileItem item, String filename) throws IOException {
        //�����ļ��ϴ�·
        File file = new File(path);

        //�ж�·���Ƿ����
        if (!file.exists())
            file.mkdirs();

        //��ȡitem�е��ϴ��ļ���������
        InputStream in = item.getInputStream();
        //����һ���ļ������
        FileOutputStream out = new FileOutputStream(path + "\\" + filename);
        //����һ��������
        byte buffer[] = new byte[1024];
        //�ж��������е������Ƿ��Ѿ�����ı�ʶ
        int len = 0;
        //ѭ�������������뵽���������У�(len=in.read(buffer))>0�ͱ�ʾin���滹������
        while((len=in.read(buffer))>0){
            //ʹ��FileOutputStream�������������������д�뵽ָ����Ŀ¼(savePath + "\\" + filename)����
            out.write(buffer, 0, len);
        }
        in.close();
        //�ر������
        out.close();
        //ɾ�������ļ��ϴ�ʱ���ɵ���ʱ�ļ�
        item.delete();

    }

    public String getPath() {
        return path;
    }

}
