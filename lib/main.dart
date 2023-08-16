import 'package:hive_flutter/hive_flutter.dart';
import 'package:x_one_test/core/constants/routes.dart';
import 'package:x_one_test/core/servicese/services.dart';
import 'package:x_one_test/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async{
  await Hive.initFlutter();

  WidgetsFlutterBinding.ensureInitialized();
  MyServices services = Get.put(MyServices());
  MyServices().init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      fallbackLocale: const Locale('ar'),
      initialRoute: AppRoutes.viewProduct,
      getPages: routes,
      // home: HomeScreen(),
      // home: AddProductView(),
      // home: ProductViewScreen(),
    );
  }
}
