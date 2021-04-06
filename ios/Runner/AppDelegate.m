#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <Flutter/Flutter.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FlutterViewController * controller = (FlutterViewController *)self.window.rootViewController;
    FlutterMethodChannel * batteryChannel = [FlutterMethodChannel methodChannelWithName:@"com.example.ConnectNativeCode/battery" binaryMessenger: controller.binaryMessenger];
    
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
      // Note: this method is invoked on the UI thread.
      if ([@"getBatteryLevel" isEqualToString:call.method]) {
          
          NSString* textFromDart = call.arguments[@"textDart"];
          NSString* textFromIOS = @"Text from iOS Native.";
          NSString* str = [NSString stringWithFormat: @" Dart send to Ios: (%@) \n Ios send to Dart: (%@)", textFromDart, textFromIOS];

          result(str);

          // result([FlutterError errorWithCode:@"UNAVAILABLE"
          //                     message:@"Battery info not available."
          //                     details:nil]);
            
      } else {
        result(FlutterMethodNotImplemented);
      }
    }];
    
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
