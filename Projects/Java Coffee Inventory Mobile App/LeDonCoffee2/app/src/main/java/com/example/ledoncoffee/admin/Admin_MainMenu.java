package com.example.ledoncoffee.admin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.ledoncoffee.R;
import com.example.ledoncoffee.common.View_GeneratedSales;
import com.example.ledoncoffee.common.View_SalesTrend;

public class Admin_MainMenu extends AppCompatActivity implements View.OnClickListener {

    private Button inventory, generate, trends, logout, settings;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_admin__main_menu);

        inventory = (Button)findViewById(R.id.admintoInventory);
        generate= (Button)findViewById(R.id.admintoGenerate);
        trends = (Button)findViewById(R.id.admintoTrend);
        logout = (Button)findViewById(R.id.admintoLogout);
        settings = (Button)findViewById(R.id.admintoSettings);

        inventory.setOnClickListener(this);
        generate.setOnClickListener(this);
        trends.setOnClickListener(this);
        logout.setOnClickListener(this);
        settings.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.admintoInventory:
                openAdminToInventory();
                break;
            case R.id.admintoGenerate:
                openAdminToGenerate();
                break;
            case R.id.admintoTrend:
                openAdminToTrends();
                break;
            case R.id.admintoLogout:
                openAdminToLogout();
                break;
            case R.id.admintoSettings:
                openAdminToSettings();
                break;
        }
    }

    public void openAdminToInventory(){
        Intent intent = new Intent(this, Admin_InventoryPick.class);
        finish();
        startActivity(intent);

    }
    public void openAdminToGenerate(){
        Intent intent = new Intent(this, View_GeneratedSales.class);
        finish();
        startActivity(intent);
    }
    public void openAdminToTrends(){
        Intent intent = new Intent(this, View_SalesTrend.class);
        finish();
        startActivity(intent);
    }

    public void openAdminToSettings(){

    }

    public void openAdminToLogout(){
        Intent intent = new Intent(this, LoginAdmin.class);
        finish();
        startActivity(intent);
    }

    @Override
    public void onBackPressed() {
        // Do Here what ever you want do on back press;
    }
}
