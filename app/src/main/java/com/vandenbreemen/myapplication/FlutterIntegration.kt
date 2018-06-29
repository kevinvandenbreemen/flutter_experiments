package com.vandenbreemen.myapplication

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.widget.Switch

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
        println("Disengage")
    }

    private fun engageFlutter() {
        println("Engage")
    }
}
