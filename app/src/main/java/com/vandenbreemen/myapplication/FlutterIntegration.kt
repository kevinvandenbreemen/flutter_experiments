package com.vandenbreemen.myapplication

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.view.ViewGroup
import android.widget.Switch
import android.widget.Toast
import com.vandenbreemen.myapplication.R.id.flutterContainer
import io.flutter.facade.Flutter
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec

class FlutterIntegration : AppCompatActivity() {

    companion object {
        const val CHANNEL = "gemini"
    }

    lateinit var messageChannel:BasicMessageChannel<String>

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

        messageChannel = BasicMessageChannel(flutterView, CHANNEL, StringCodec.INSTANCE)
        messageChannel.setMessageHandler(BasicMessageChannel.MessageHandler { incoming, reply ->
            Toast.makeText(this, incoming, Toast.LENGTH_LONG).show()
            reply.reply("MSG RECEIVED") //  Why doesn't this count as a message going to the channel??
            messageChannel.send("RECEIVED - SENT VIA send()")
        })
    }
}
