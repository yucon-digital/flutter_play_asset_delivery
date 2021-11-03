#import "FlutterPlayAssetDeliveryPlugin.h"
#if __has_include(<flutter_play_asset_delivery/flutter_play_asset_delivery-Swift.h>)
#import <flutter_play_asset_delivery/flutter_play_asset_delivery-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_play_asset_delivery-Swift.h"
#endif

@implementation FlutterPlayAssetDeliveryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPlayAssetDeliveryPlugin registerWithRegistrar:registrar];
}
@end
