import 'package:flutter/foundation.dart';

enum ENV {
  production,
  staging,
}

const ENV appEnv = kReleaseMode ? ENV.production : ENV.staging;

class EnvConfig {
  EnvConfig._();
/* API CONFIG */

  static const productionUrl = String.fromEnvironment('base_url');
  static const stagingUrl = String.fromEnvironment('base_url');
  static const edamamFoodAppId = String.fromEnvironment('food_app_id');
  static const edamamFoodAppKey = String.fromEnvironment('food_app_key');

  static String getBaseUrl(ENV deployEnv) {
    switch (deployEnv) {
      case ENV.staging:
        return stagingUrl;
      case ENV.production:
        return productionUrl;
      default:
        return stagingUrl;
    }
  }
}
