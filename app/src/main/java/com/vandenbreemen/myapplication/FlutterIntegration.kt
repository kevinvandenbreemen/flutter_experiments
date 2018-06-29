package com.vandenbreemen.myapplication

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.view.ViewGroup
import android.widget.Switch
import com.vandenbreemen.myapplication.R.id.flutterContainer
import io.flutter.facade.Flutter

class FlutterIntegration : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_flutter_integration)

        findViewById<Switch>(R.id.flutterToggle).setOnClickListener(View.OnClickListener { v ->
            val switch = findViewById<Switch>(R.id.flutterToggle)
            if(switch.isChecked){
                engageFlutter()
            }
            else{
                disengageFlutter()
            }
        })
    }

    private fun disengageFlutter() {
        findViewById<ViewGroup>(flutterContainer).removeAllViews()
    }

    private fun engageFlutter() {
        val flutterView = Flutter.createView(this, lifecycle,"route1")
        findViewById<ViewGroup>(flutterContainer).addView(flutterView)
    }
}
