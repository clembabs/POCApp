import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import 'get_storage_service.dart';

abstract class KeyValueStorageService {
  Future<void> saveString({required String key, required String value});

  String? readString({required String key});

  Future<void> saveInteger({required String key, int? value});

  int? readInteger({required String key});

  Future<void> saveBool({required String key, required bool value});

  bool? readBool({required String key});

  Future<void> saveMap({
    required String key,
    required Map<String, dynamic> value,
  });

  Map<String, dynamic>? readMap({required String key});

  Future<void> saveList({
    required String key,
    required List<Map<String, dynamic>> value,
  });

  List<Map<String, dynamic>>? readList({required String key});

  Future<void> delete({required String key});
}

final keyValueStorageServiceProvider = Provider<KeyValueStorageService>(
  (ref) => GetStorageService(storage: GetStorage()),
);
