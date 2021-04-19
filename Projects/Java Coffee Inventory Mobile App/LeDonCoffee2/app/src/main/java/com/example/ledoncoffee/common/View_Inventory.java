package com.example.ledoncoffee.common;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;

import com.example.ledoncoffee.FileIO;
import com.example.ledoncoffee.R;

import org.w3c.dom.Text;

import java.io.File;

public class View_Inventory extends AppCompatActivity {

    private String[] itemName = new String[100];
    private float[] itemPrice = new float[100];
    private int[] itemQty = new int[100];
    private FileIO file;
    private TextView contents;
    private String row;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view__inventory);

        contents = (TextView)findViewById(R.id.tableContents);
        file = new FileIO();

        createInventoryTable();
        contents.setText(file.readFromFile(this));

    }

    public void createInventoryTable() {

        //fills the inventory
        addItem();
        System.out.println("This is the file contents:");
        System.out.println(file.readFromFile(this));

    }

    public void addItem(){

        for(int i=0;i<100;i++){
            int prodID = i + 1;

            itemName[i] = "Item" + i;

            itemPrice[i] = (float) (i + 1);
            String sPrice = Float.toString(itemPrice[i]);
            System.out.println("Converted " + itemPrice [i] + " to " + "price" + sPrice);

            itemQty[i] = 100;
            String sQty = Integer.toString(itemQty[i]);
            System.out.println("Converted " + itemQty [i] + " to " + "qty" + sQty);

                if(i<9)
                    row = "0" + prodID + "\t\t\t\t\t\t\t\t" + itemName[i] + "\t\t\t\t\t\t\t\t\t\t" + sPrice + "\t\t\t\t\t\t\t\t" + sQty + "\n";
                else
                    row =prodID + "\t\t\t\t\t\t\t\t" + itemName[i] + "\t\t\t\t\t\t\t\t\t\t" + sPrice + "\t\t\t\t\t\t\t\t" + sQty + "\n";

            file.writeToFile(row, this);
        }
    }



    @Override
    public void onBackPressed() {
        // disable back pressed
    }

}
