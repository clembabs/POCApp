import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_app/src/core/constants/storage_keys.dart';
import 'package:poc_app/src/services/key_value_storage/key_value_storage_service.dart';

class LocalStoreHelper {
  static dynamic setOnboarding(WidgetRef ref) async {
    await ref
        .read(keyValueStorageServiceProvider)
        .saveBool(key: StorageKeys.onboardingPageViewed, value: true);
  }

  static bool readOnboarding(WidgetRef ref) {
    final result = ref
        .read(keyValueStorageServiceProvider)
        .readBool(key: StorageKeys.onboardingPageViewed);
    return result ?? false;
  }
}
