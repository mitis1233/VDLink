package com.example.vdlink;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;

public class MainActivity extends Activity {

    private static final String VIRTUAL_DESKTOP_PACKAGE_NAME = "VirtualDesktop.Android";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        PackageManager pm = getPackageManager();
        Intent launchIntent = pm.getLaunchIntentForPackage(VIRTUAL_DESKTOP_PACKAGE_NAME);

        if (launchIntent != null) {
            // Start Virtual Desktop
            startActivity(launchIntent);
        } else {
            // App not installed, redirect to Play Store
            Toast.makeText(this, "Virtual Desktop App not found. Redirecting to Play Store.", Toast.LENGTH_LONG).show();
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + VIRTUAL_DESKTOP_PACKAGE_NAME)));
            } catch (android.content.ActivityNotFoundException anfe) {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=" + VIRTUAL_DESKTOP_PACKAGE_NAME)));
            }
        }
        // Finish this activity once it has done its job
        finish();
    }
}
