import 'package:get_it/get_it.dart';

import 'package:testappno/remote_config.dart';
GetIt locator=GetIt.instance;
Future setupLocator() async {
var remoteConfigService =await RemoteConfigService.getInstance();
locator.registerSingleton(remoteConfigService);
}