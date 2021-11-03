import Flutter
import UIKit

public class SwiftFlutterPlayAssetDeliveryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_play_asset_delivery", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPlayAssetDeliveryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
