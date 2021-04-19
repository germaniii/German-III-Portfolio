package com.example.ledoncoffee.admin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.ledoncoffee.common.MainActivity;
import com.example.ledoncoffee.R;

public class LoginAdmin extends AppCompatActivity implements View.OnClickListener {

    private Button login, back;
    private EditText inputPassword;
    private TextView text;
    private int tries = 5;
    private CountDownTimer countDown;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login_admin);

        login = (Button)findViewById(R.id.ToLogin);
        back = (Button)findViewById(R.id.adminToSelection);
        inputPassword = (EditText)findViewById(R.id.adminPassword);
        text = (TextView)findViewById(R.id.loginStatus);

        login.setOnClickListener(this);
        back.setOnClickListener(this);



    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.ToLogin:
                openToLogin();
                break;
            case R.id.adminToSelection:
                openAdminToSelection();
                break;
        }
    }

    public void openToLogin() {
        if (tries > 0) {
            if (checkPassword()) {
                Intent intent = new Intent(this, Admin_MainMenu.class);
                finish();
                startActivity(intent);
            }else {
                text.setText("Wrong Password! You have " + tries + " try left.");
                tries--;
            }
        }else{
            //countdown timer for login invalid
            login.setEnabled(false);
            wrongPasswordTimer();
        }
    }

    public void openAdminToSelection(){
        Intent intent = new Intent(this, MainActivity.class);
        finish();
        startActivity(intent);
    }

    public boolean checkPassword(){
        String pw = inputPassword.getText().toString();
            if(pw.equals("none"))
                return true;
            else
                return false;
    }

    public void wrongPasswordTimer(){
        countDown = new CountDownTimer(30000,1000) {
            @Override
            public void onTick(long millisUntilFinished) {
                text.setText("Please wait "+ millisUntilFinished/1000 +  " seconds before inputting again.");
            }

            @Override
            public void onFinish() {
                text.setText("You may now input password");
                login.setEnabled(true);
                tries=5;
            }
        }.start();
    }




    @Override
    public void onBackPressed() {
        // Nothing happens when back key is pressed;
    }

}
