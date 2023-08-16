import 'package:get/get.dart';
import 'package:x_one_test/core/class/store_data.dart';
import 'package:x_one_test/core/constants/imageassets.dart';
import 'package:x_one_test/ui/ProductView/productmodel.dart';

class ProductViewController extends GetxController {
  late  Rx<List<ProductModel>>productList;
  late  Rx<List<ProductModel>>allProductList;
  RxInt catId=0.obs;
  RxBool showDetails=false.obs;
  RxInt details=100000.obs;

  List<Map<String,dynamic>> storeImage = [
    {
      "id":0,
      "name":"الكل",
      "image":AppImageAsset.product
    },
    {
      "id":1,
      "name":"تصنيف 1",
      "image":AppImageAsset.product

    },
    {
      "id":2,
      "name":"تصنيف 2",
      "image":AppImageAsset.product

    },
    {
      "id":3,
      "name":"تصنيف 3",
      "image":AppImageAsset.product

    },
  ].obs;

  @override
  void onInit() {
    productList = RxList<ProductModel>.empty(growable: true).obs;
    allProductList = RxList<ProductModel>.empty(growable: true).obs;
    getProduct();
    super.onInit();
  }


  getProduct()async{
    try{
      productList.value.clear();
      allProductList.value.clear();
      await SaveData().getAllDataWithbox(boxName: "product").then((value){
        if(value.isNotEmpty){
          for (var element in value) {
            allProductList.value.add(ProductModel.fromJson(element));

            if(catId.value==0) {
              productList.value.add(ProductModel.fromJson(element));
            }else{
              productList.value.addIf(catId.value==int.tryParse(element["categories"].toString()),ProductModel.fromJson(element));
            }
          }
          Get.appUpdate();
        }else{
        }
      });
    }catch(e){
    }

  }
  deleteProduct(String name)async{
    try{
      int i=allProductList.value.indexWhere((element) => element.productName.toString()==name.toString());
      if(i!=-1){
        print(i.toString());
        await SaveData().deleteIndexFromBox(index: i);
        getProduct();
      }else{
        print("العنصر غير موجود");
      }
    }catch(e){
    }

  }


}