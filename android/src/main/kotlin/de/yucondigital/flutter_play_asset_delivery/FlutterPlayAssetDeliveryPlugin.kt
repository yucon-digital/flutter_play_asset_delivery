package de.yucondigital.flutter_play_asset_delivery

import android.app.Activity
import android.content.Context
import android.content.res.AssetManager
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.systemchannels.SettingsChannel.CHANNEL_NAME
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import java.io.File

/** FlutterPlayAssetDeliveryPlugin */
class FlutterPlayAssetDeliveryPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var assetManager : AssetManager
  private lateinit var assetList : List<String>

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    assetManager = flutterPluginBinding.applicationContext.assets
    fetchAllAssets()

    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_play_asset_delivery")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getAssetFile") {
      var assetName: String = call.arguments.toString()

      if (assetList.contains(assetName)) {
        val file: File = createTempFile()
        file.writeBytes(assetManager.open(assetName).readBytes())
        result.success(file.absolutePath)
      } else {
        result.error("Asset not found", "Asset could not be found.", null)
      }
    } else {
      result.notImplemented()
    }
  }

  private fun fetchAllAssets() {
    assetList = assetManager.list("")?.asList() ?: emptyList()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
