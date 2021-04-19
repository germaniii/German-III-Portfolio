package com.example.ledoncoffee.common;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.ledoncoffee.R;

public class View_SalesTrend extends AppCompatActivity implements View.OnClickListener {

    private Button back;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view__sales_trend);

        back = (Button)findViewById(R.id.salesTrend_Back);
        back.setOnClickListener((View.OnClickListener) this);

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.salesTrend_Back:
                openSalesTrend_Back();
                break;
        }
}

    private void openSalesTrend_Back() {
        Intent intent = new Intent(this, MainActivity.class);
        finish();
        startActivity(intent);
    }
}
