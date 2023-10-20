import 'package:get_storage/get_storage.dart';

import 'key_value_storage_service.dart';

class GetStorageService implements KeyValueStorageService {
  GetStorageService({required this.storage});

  final GetStorage storage;

  @override
  Future<void> saveString({required String key, required String value}) =>
      storage.write(key, value);

  @override
  String? readString({required String key}) => storage.read<String>(key);

  @override
  Future<void> saveInteger({required String key, int? value}) =>
      storage.write(key, value);

  @override
  int? readInteger({required String key}) => storage.read<int>(key);

  @override
  Future<void> saveBool({required String key, required bool value}) =>
      storage.write(key, value);

  @override
  bool? readBool({required String key}) => storage.read<bool>(key);

  @override
  Future<void> saveMap({
    required String key,
    required Map<String, dynamic> value,
  }) =>
      storage.write(key, value);

  @override
  Map<String, dynamic>? readMap({required String key}) =>
      storage.read<Map<String, dynamic>>(key);

  @override
  Future<void> saveList({
    required String key,
    required List<Map<String, dynamic>> value,
  }) async {
    await storage.write(key, value);
  }

  @override
  List<Map<String, dynamic>>? readList({required String key}) =>
      storage.read<List<Map<String, dynamic>>>(key);

  @override
  Future<void> delete({required String key}) => storage.remove(key);
}
