import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class GetDeviceInfo {
  
  static String? _deviceOS;  
  static String get deviceOS => _deviceOS ?? "unknown";
  static String? _deviceID;
  static String get deviceID => _deviceID ?? "unknown";
  static int? _deviceSDKVersion;
  static int get deviceSDKVersion => _deviceSDKVersion ?? 0;

  static Future<void> getAndroidDeviceDetails() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
   
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      _deviceOS = "ANDROID";
      _deviceID = androidDeviceInfo.id;
      _deviceSDKVersion = androidDeviceInfo.version.sdkInt;
      /// 

    }else if(Platform.isIOS){
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      _deviceOS = "iOS";
      _deviceID = iosDeviceInfo.model;
      _deviceSDKVersion = int.parse(iosDeviceInfo.systemVersion);
      ///

    }else{
      _deviceOS = "unknown";
      _deviceID = "unknown";
    }
  }
  ///

}
