package com.example.ledoncoffee.common;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.example.ledoncoffee.R;

public class View_GeneratedSales extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view__generated_sales);

        Button back = (Button) findViewById(R.id.salesTrend_Back);
        back.setOnClickListener((View.OnClickListener) this);

    }

    @Override
    public void onClick(View v) {
        if (v.getId() == R.id.salesTrend_Back)
                openSalesTrend_Back();
    }

    private void openSalesTrend_Back() {
        Intent intent = new Intent(this, MainActivity.class);
        finish();
        startActivity(intent);
    }
}
