package com.example.ledoncoffee.admin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.ledoncoffee.R;
import com.example.ledoncoffee.common.View_Inventory;

public class Admin_InventoryPick extends AppCompatActivity implements View.OnClickListener {

    private Button addItem, viewInventory, goBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_admin__inventory_pick);

        addItem = (Button)findViewById(R.id.toAddItemInventory);
        viewInventory = (Button)findViewById(R.id.admintoViewInventory);
        goBack = (Button)findViewById(R.id.invtoBack);

        addItem.setOnClickListener(this);
        viewInventory.setOnClickListener(this);
        goBack.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.toAddItemInventory:
                openToAddItemInventory();
                break;
            case R.id.admintoViewInventory:
                openAdminToViewInventory();
                break;
            case R.id.invtoBack:
                openinvToBack();
                break;
        }
    }

    public void openToAddItemInventory(){
        Intent intent = new Intent(this, Admin_Inventory_AddItem.class);
        finish();
        startActivity(intent);
    }
    public void openAdminToViewInventory(){
        Intent intent = new Intent(this, View_Inventory.class);
        finish();
        startActivity(intent);
    }
    public void openinvToBack(){
        Intent intent = new Intent(this, Admin_MainMenu.class);
        finish();
        startActivity(intent);
    }
}
