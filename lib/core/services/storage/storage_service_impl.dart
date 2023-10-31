part of 'storage_service.dart';

class StorageService {

  Future<void> saveAuthToken(String data) async {
    await storage.setString(StorageKeys.authToken, data);
  }

  Future<String?> getAuthToken() async {
    final key = storage.getString(StorageKeys.authToken);
    if (key != null) {
      return key;
    } else {
      return key;
    }
  }


  Future<void> clearStorage() async {
    await storage.clear();
    // final list = storage.getKeys();
    // for (var key in list) {
    //   if (key != StorageKeys.uiLocale) {
    //     await storage.remove(key);
    // }
    // await FirebaseCrashlytics.instance.setUserIdentifier("");
  }

}
