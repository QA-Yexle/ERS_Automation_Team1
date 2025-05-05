package utils;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;

public class textFileHandling {

    public static FileReader fileReader;
    public static FileInputStream fis;
    public static BufferedReader br;
    public static String textReaderline;

    public String textFileReader(String filepath) {

        try {

            fileReader = new FileReader(filepath);

            br = new BufferedReader(fileReader);

            StringBuffer stb = new StringBuffer();
            while ((textReaderline = br.readLine()) != null) {


                stb.append(textReaderline);


            }

            textReaderline = stb.toString();

        } catch (Exception e) {

        }


        return textReaderline;
    }

}
