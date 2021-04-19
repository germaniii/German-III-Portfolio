package com.example.ledoncoffee.admin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.ledoncoffee.R;

import org.w3c.dom.Text;

public class Admin_Inventory_AddItem extends AppCompatActivity implements View.OnClickListener {

    private EditText itemName, itemPrice, itemQty;
    private Button add,back;
    private TextView hint;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_admin__inventory__additem);

        itemName = (EditText) findViewById(R.id.addItemName);
        itemPrice = (EditText) findViewById(R.id.addItemPrice);
        itemQty = (EditText) findViewById(R.id.addItemQty);
        add = (Button)findViewById(R.id.addItemButton);
        back = (Button)findViewById(R.id.addItemToBack) ;
        hint = (TextView)findViewById(R.id.hintText);

        add.setOnClickListener(this);
        back.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.addItemButton:
                addItem();
                break;
            case R.id.addItemToBack:
                goBack();
                break;
        }
    }

    public void addItem(){
        if(itemName.getText().length() == 0 || itemQty.getText().length() == 0 || itemPrice.getText().length() == 0 ){
            hint.setText("Please fill out missing fields!");
        }else{
            hint.setText("Item successfully added!");
        }
    }

    public void goBack(){
        Intent intent = new Intent(this, Admin_InventoryPick.class);
        finish();
        startActivity(intent);
    }

    @Override
    public void onBackPressed() {
        // Do Here what ever you want do on back press;
    }

}
