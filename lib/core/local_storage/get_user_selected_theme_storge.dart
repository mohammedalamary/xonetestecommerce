// import 'package:get_storage/get_storage.dart';
// import 'package:wallet_app/core/local_storage/storage_provider.dart';
//
// class UserSelectedThemeStorage extends LocalStorage {
//   var box = GetStorage();
//   static bool isDark = false;
//   @override
//   // ignore: todo
//   // TODO: implement keyStore
//   String get keyStore => 'isDarkMode';
//   @override
//   saveLocal({required dynamic data}) async {
//     await box.write(keyStore, data);
//   }
//   @override
//   Future<bool> getLocal() async {
//     return await box.read(keyStore) ?? false;
//   }
//   getValueMode() async {
//     isDark = await getLocal();
//   }
//   @override
//   deleteLocal() {
//     // ignore: todo
//     // TODO: implement deleteLocal
//     throw UnimplementedError();
//   }
// }
