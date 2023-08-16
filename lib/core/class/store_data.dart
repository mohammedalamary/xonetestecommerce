import 'package:hive/hive.dart';
import 'package:x_one_test/core/constants/global_data.dart';
import 'package:x_one_test/core/constants/global_key.dart';

class SaveData{
  saveDataWithBox({required var data,required String boxName}) async {
    var box = await Hive.openBox(boxName); //open the hive box before writing
    await box.add(data);
  }

  Future<dynamic> getDataWithId({String id="",String boxName="product"}) async {

    // UserModel user =UserModel();
    var box = await Hive.openBox(boxName);
    // var data=await box.values;
    var data=await box.get(id,defaultValue: "");
    print('one data hhhhhhhhhhhhhh');
    print(data);
    if(data.isNotEmpty){
      print("is favoret=true");
      // user=UserModel.fromMap(Map.from(data));
      return data;
    }else {
      print("is favoret=false");

      return "";
    }
  }
  Future<dynamic> getAllDataWithbox({String boxName="product"}) async {
    // UserModel user =UserModel();
    var box = await Hive.openBox(boxName);
    // var data=await box.values;
    var data= box.values.toList();
    print('all Data hhhhhhhhhhhhhh');
    print(data);
    if(data.isNotEmpty){
      // user=UserModel.fromMap(Map.from(data));
      return data;
    }else {
      return "";
    }
  }
  deleteIndexFromBox({required int index,String boxName="product"}) async {
    var box = await Hive.openBox(boxName);
    await box.deleteAt(index);
  }
}