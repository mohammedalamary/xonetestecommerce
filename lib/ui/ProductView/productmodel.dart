class ProductModel{
   String? productName;
   String? store;
   String? price;
   String? categories;
   String? img;
   String? img2;
   String? img3;
   String? img4;
   int? countImg;
  ProductModel({this.productName, this.store, this.price,this.categories,this.img,this.img2,this.img3,this.img4,this.countImg=0});

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    productName = json['productName'];
    store = json['store'];
    price = json['price'];
    categories = json['categories'];
    img = json['img'].toString().isNotEmpty?json['img']:json['img2'].toString().isNotEmpty?json['img2'].toString():json['img3'].toString().isNotEmpty?json['img3'].toString():json['img4'].toString().isNotEmpty?json['img4'].toString():null;
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
    countImg = json['countImg'];
  }

   Map<dynamic, dynamic> toJson() {
     final Map<dynamic, dynamic> data =  Map<dynamic, dynamic>();
     data['productName'] = productName;
     data['store'] = store;
     data['price'] = price;
     data['categories'] = categories;
     data['img'] = img;
     data['img2'] = img2;
     data['img3'] = img3;
     data['img4'] = img4;
     data['countImg'] = countImg;

     return data;
   }

}