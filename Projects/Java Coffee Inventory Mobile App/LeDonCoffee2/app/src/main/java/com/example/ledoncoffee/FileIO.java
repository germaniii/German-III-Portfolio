package com.example.ledoncoffee;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import com.example.ledoncoffee.common.View_Inventory;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class FileIO extends Application {

    private String data;

    public void writeToFile(String datum, Context context) {
        try{
            File file = new File(context.getFilesDir(), "inventory.txt");

            //if file doesn't exists, then create it
            if(!file.exists()){
                file.createNewFile();
                System.out.println("New File Created Now");
            }

            //true = append file
            FileWriter fileWriter = new FileWriter(file,true);
            BufferedWriter bufferWriter = new BufferedWriter(fileWriter);
            bufferWriter.write(datum);
            bufferWriter.close();
            fileWriter.close();

            System.out.println("Done");

        }catch(Exception e){
            e.printStackTrace();
        }

    }


    public String readFromFile(Context context) {
        String ret = "";

        try {
            InputStream inputStream = context.openFileInput("inventory.txt");

            if (inputStream != null) {
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
                String receiveString = "";
                StringBuilder stringBuilder = new StringBuilder();

                while ((receiveString = bufferedReader.readLine()) != null) {
                    stringBuilder.append("\n").append(receiveString);
                }

                inputStream.close();
                ret = stringBuilder.toString();
            }
        } catch (FileNotFoundException e) {
            Log.e("login activity", "File not found: " + e.toString());
        } catch (IOException e) {
            Log.e("login activity", "Can not read file: " + e.toString());
        }

        return ret;

    }


}
