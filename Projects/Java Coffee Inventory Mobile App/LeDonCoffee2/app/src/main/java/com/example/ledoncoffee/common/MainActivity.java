package com.example.ledoncoffee.common;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.ledoncoffee.R;
import com.example.ledoncoffee.admin.LoginAdmin;
import com.example.ledoncoffee.cashier.MainMenu;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    public Button admin, cashier;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        admin = (Button) findViewById(R.id.toAdmin);
        cashier= (Button) findViewById(R.id.toCashier);

        admin.setOnClickListener(this);
        cashier.setOnClickListener(this);

    }

    public void openToAdmin(){
        Intent intent = new Intent(this, LoginAdmin.class);
        finish();
        startActivity(intent);
    }

    public void openToCashier(){
        Intent intent = new Intent(this, MainMenu.class);
        finish();
        startActivity(intent);
    }
    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.toAdmin:
                openToAdmin();
                break;
            case R.id.toCashier:
                openToCashier();
                break;
        }
    }
}
