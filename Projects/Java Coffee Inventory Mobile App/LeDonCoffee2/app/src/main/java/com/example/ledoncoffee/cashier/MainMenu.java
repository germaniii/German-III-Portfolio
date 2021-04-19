package com.example.ledoncoffee.cashier;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.ledoncoffee.common.MainActivity;
import com.example.ledoncoffee.R;
import com.example.ledoncoffee.common.View_GeneratedSales;
import com.example.ledoncoffee.common.View_Inventory;
import com.example.ledoncoffee.common.View_SalesTrend;

public class MainMenu extends AppCompatActivity implements View.OnClickListener {

    private Button inventory, generate, trends, logout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_menu);

        inventory = (Button)findViewById(R.id.cashtoInventory);
        generate= (Button)findViewById(R.id.cashtoGenerate);
        trends = (Button)findViewById(R.id.cashtoTrends);
        logout = (Button)findViewById(R.id.cashtoLogout);

        inventory.setOnClickListener(this);
        generate.setOnClickListener(this);
        trends.setOnClickListener(this);
        logout.setOnClickListener(this);


    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.cashtoInventory:
                openCashToInventory();
                break;
            case R.id.cashtoGenerate:
                openCashToGenerate();
                break;
            case R.id.cashtoTrends:
                openCashToTrends();
                break;
            case R.id.cashtoLogout:
                openCashToLogout();
                break;
        }
    }

    public void openCashToInventory(){
        Intent intent = new Intent(this, View_Inventory.class);
        finish();
        startActivity(intent);
    }
    public void openCashToGenerate(){
        Intent intent = new Intent(this, View_GeneratedSales.class);
        finish();
        startActivity(intent);
    }
    public void openCashToTrends(){
        Intent intent = new Intent(this, View_SalesTrend.class);
        finish();
        startActivity(intent);
    }
    public void openCashToLogout(){
        Intent intent = new Intent(this, MainActivity.class);
            finish();
            startActivity(intent);
    }

    @Override
    public void onBackPressed() {
        // Do Here what ever you want do on back press;
    }

}
