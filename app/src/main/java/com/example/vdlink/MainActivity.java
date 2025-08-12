package com.example.vdlink;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;

public class MainActivity extends Activity {

    private static final String VIRTUAL_DESKTOP_PACKAGE_NAME = "VirtualDesktop.Android";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        PackageManager pm = getPackageManager();
        Intent launchIntent = pm.getLaunchIntentForPackage(VIRTUAL_DESKTOP_PACKAGE_NAME);

        if (launchIntent != null) {
            // 嘗試將 Virtual Desktop 從後台拉到前台
            launchIntent.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
            launchIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
            startActivity(launchIntent);
        }

        // 無論有沒有啟動成功，直接結束自己
        finish();
    }
}
