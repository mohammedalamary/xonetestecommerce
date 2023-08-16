import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:x_one_test/core/class/store_data.dart';
import 'package:x_one_test/core/constants/global_data.dart';
import 'package:x_one_test/core/model/spinner.dart';
import 'package:x_one_test/core/servicese/services.dart';
import 'package:x_one_test/ui/ProductView/productmodel.dart';
import 'package:x_one_test/ui/wdgit/get_image_bottom_sheet.dart';

class AddProductController extends GetxController {
   RxString img0="".obs;
  late RxString img1="".obs;
  late RxString img2="".obs;
  late RxString img3="".obs;
  RxInt countImg =0.obs;
  late TextEditingController productName, storeName, priceController, categoryCont;

  Rx<List<ProductModel>> products = Rx<List<ProductModel>>([]);
  late ProductModel productModel;
  var itemCount = 0.obs;

  MyServices myServices = Get.find<MyServices>();
  late List<Spinner> spinnerTypeCategories;
   late GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void onInit() {
    productName = TextEditingController();
    storeName = TextEditingController();
    priceController = TextEditingController();
    categoryCont = TextEditingController();
    spinnerTypeCategories = List<Spinner>.empty(growable: true).obs;

    super.onInit();
    // storageProduct();
    categoriesData();
  }

  List<Map<String,dynamic>> categories = [
    {
      "id":0,
      "name":"الكل"
    },
    {
      "id":1,
      "name":"تصنيف 1"
    },
    {
      "id":2,
      "name":"تصنيف 2"
    },
    {
      "id":3,
      "name":"تصنيف 3"
    },
  ];


  addProduct({String? nameProduct, String? store, String? price,String? categoriesId}) {
    if(globalKey.currentState!.validate()) {
      productModel = ProductModel(productName: nameProduct,
          store: store,
          price: price,
          categories: categoriesId,
          img: img0.value,
          countImg: countImg.value,
          img2: img1.value,
          img3: img2.value,
          img4: img3.value);
      products.value.add(productModel);
      itemCount.value = products.value.length;
      myServices.getStorage.write(GlobalData.productsList, products.value);

      SaveData().saveDataWithBox(
          data: productModel.toJson(), boxName: "product");
      productName.clear();
      priceController.clear();
      categoryCont.clear();
      storeName.clear();
      img0.value = "";
      img1.value = "";
      img2.value = "";
      img3.value = "";
      countImg.value = 0;
      update();
    }
  }

  categoriesData(){
    for (var element in categories) {
      spinnerTypeCategories.add(Spinner(
        id: element['id'],
        nameAr:element['name'],));
      print("elemet------------$element");
    }
  }
  selectImg(index) async {
    await CustomGetImageBottomSheet().getImage((imageSelect) async {
      if (imageSelect.isNotEmpty) {
        countImg.value= countImg.value+1;
        if(index==0){
          img0.value=imageSelect.toString();
        }else if(index==1){
          img1.value=imageSelect.toString();
        }else if(index==2){
          img2.value=imageSelect.toString();
        }else if(index==3){
          img3.value=imageSelect.toString();
        }
        update();
      }
    });
  }


   String? validateField(String? value){
     if(value!.isEmpty){
       return "هده الحقل مطلوب";
     }
     return null;
   }
}
