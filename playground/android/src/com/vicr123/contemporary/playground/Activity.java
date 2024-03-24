package com.vicr123.contemporary.playground;

import org.qtproject.qt.android.bindings.QtActivity;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;

public class Activity extends QtActivity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        Window w = getWindow();
        w.setDecorFitsSystemWindows(false);
        w.setFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS, WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);

        super.onCreate(savedInstanceState);
    }
}
