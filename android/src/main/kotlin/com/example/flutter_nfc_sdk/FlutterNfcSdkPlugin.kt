package com.example.flutter_nfc_sdk

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.nfc.NfcAdapter
import android.text.TextUtils
import android.widget.Toast
import androidx.core.content.ContextCompat

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FlutterNfcSdkPlugin */
class FlutterNfcSdkPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var mNfcAdapter: NfcAdapter? = null
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_nfc_sdk")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        mNfcAdapter = NfcAdapter.getDefaultAdapter(context)
        initNFCFunction("")
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "searchCard" -> {
                // Define the sunyardReadCard method or import it from the correct package
            }
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun initNFCFunction(ndefMessage: String) {
        if (supportNfcHceFeature()) {
            initService( ndefMessage)
        } else {
            if (supportNfcHceFeature()) {
                // showTurnOnNfcDialog()
            }
        }
    }

    private fun supportNfcHceFeature() =
        // Define the checkNFCEnable method or import it from the correct package
        checkNFCEnable() && context.packageManager.hasSystemFeature(PackageManager.FEATURE_NFC_HOST_CARD_EMULATION)

    private fun checkNFCEnable(): Boolean {
        return if (mNfcAdapter == null) {
            false
        } else {
            mNfcAdapter?.isEnabled == true
        }
    }

    private fun initService( ndefMessage: String) {
        if (TextUtils.isEmpty(ndefMessage)) {
            Toast.makeText(
                context,
                "please write something in editText",
                Toast.LENGTH_LONG,
            ).show()
        } else {
            val intent = Intent(context, KHostApduService::class.java)
            intent.putExtra("ndefMessage", ndefMessage)
            ContextCompat.startForegroundService(context, intent)
        }
    }
}