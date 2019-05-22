package com.example.flutter_app

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, "com.example.flutter_app").setMethodCallHandler { call, result ->
            if (call.method == "callCameraActivity") {
                callCameraActivity()
                result.success(0)
            }
        }
    }

    /**
     * カメラ画面を呼び出す
     */
    private fun callCameraActivity() {
        val intent = Intent(this, CameraActivity::class.java)
        startActivity(intent)
    }
}
