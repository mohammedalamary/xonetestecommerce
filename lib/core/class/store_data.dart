import 'package:hive/hive.dart';
class SaveData{
  saveDataWithBox({required var data,required String boxName}) async {
    var box = await Hive.openBox(boxName); //open the hive box before writing
    await box.add(data);
  }
  Future<dynamic> getDataWithId({String id="",String boxName="product"}) async {
    var box = await Hive.openBox(boxName);
    var data=await box.get(id,defaultValue: "");
    print('one data hhhhhhhhhhhhhh');
    print(data);
    if(data.isNotEmpty){
      return data;
    }else {
      print("is favoret=false");
      return "";
    }
  }
  Future<dynamic> getAllDataWithbox({String boxName="product"}) async {
    var box = await Hive.openBox(boxName);
    var data= box.values.toList();
    print('all Data hhhhhhhhhhhhhh');
    print(data);
    if(data.isNotEmpty){
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