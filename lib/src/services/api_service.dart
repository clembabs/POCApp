import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_app/src/services/env_config.dart';

class ApiService {
  final Ref ref;
  final Dio client = Dio();

  ApiService(this.ref) {
    _init();
  }

  void _init() {
    client.options.baseUrl = EnvConfig.getBaseUrl(appEnv);
    // client.options.connectTimeout = const Duration(milliseconds: 5000);
    // client.options.receiveTimeout = const Duration(milliseconds: 5000);
  }
}

Future<void> _logOut() async {
  // await ref
  //     .read(keyValueStorageServiceProvider)
  //     .delete(key: StorageKeys.authToken);
}

final apiServiceProvider = Provider<ApiService>((ref) => ApiService(ref));
