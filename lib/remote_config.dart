import 'package:firebase_remote_config/firebase_remote_config.dart';
const String _ShowMainBanner="show main banner";
class RemoteConfigService{
  final FirebaseRemoteConfig _remoteConfig;
  final defaults =<String ,dynamic>{_ShowMainBanner:false};
  static RemoteConfigService? _instance;
  static Future<RemoteConfigService> getInstance() async{
    if(_instance==null){
      _instance=RemoteConfigService(remoteConfig: await FirebaseRemoteConfig.instance);
    }
    return _instance!;
  }

  RemoteConfigService({required FirebaseRemoteConfig remoteConfig}): _remoteConfig=remoteConfig;
bool get ShowMainBanner=>_remoteConfig.getBool(_ShowMainBanner);
Future initialize() async{
  try{
    await _remoteConfig.setDefaults(defaults);
    await _fetchAndActivate();
  } catch(e){
    print('unable to fetch remote config');
  }
   
}
  Future _fetchAndActivate() async {
    await _remoteConfig.fetch();
    await _remoteConfig.activate();
  }
  
}