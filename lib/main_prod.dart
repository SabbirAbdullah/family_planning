import 'package:flutter/material.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';


void main() {
  EnvConfig prodConfig = EnvConfig(
    appName: "Family Planning",
    baseUrl: "",
    shouldCollectCrashLog: true,
  );
  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  runApp(const MyApp());
}
