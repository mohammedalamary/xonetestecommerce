import 'package:x_one_test/core/constants/routes.dart';
import 'package:x_one_test/ui/ProductView/productview.dart';
import 'package:x_one_test/ui/addproduct/addproduct_view.dart';
import 'package:get/get.dart';
List<GetPage<dynamic>>?routes=[
  GetPage(name:AppRoutes.viewProduct ,page: () => ProductViewScreen(),),
  GetPage(name:AppRoutes.addProduct ,page: () => AddProductView(),),
];
