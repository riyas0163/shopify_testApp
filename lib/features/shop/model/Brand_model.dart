

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;


  BrandModel({
    required this.id,
    required this.name,
    required this.image,
     this.isFeatured,
     this.productCount,
});


  /// empty helper function
static BrandModel empty() => BrandModel(id: '', name: '', image: '',);

/// convert model to json structure so that you can store data in firebase

toJson() {
  return {
    'Id' : id,
    'Name' : name,
    'Image' : image,
    'ProductCount' : productCount,
    'IsFeatured' : isFeatured,
  };
}

factory BrandModel.fromJson(Map<String, dynamic> document) {
  final data = document;
  if(data.isEmpty) return BrandModel.empty();
  return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
    isFeatured: data['IsFeatured'] ?? false,
    productCount: int.parse((data['ProductCount'] ?? 0).toString())
  );
}

factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String ,dynamic>> document) {
  if(document.data() != null) {
    final data = document.data()!;

    /// map JSON record to the model
    return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
      productCount:  data['ProductCount'] ?? '',
      isFeatured: data['IsFeatured'] ?? '',
    );
  } else {
    return BrandModel.empty();
  }
}










}


// class BrandModel {
//   String id;
//   String name;
//   String image;
//   bool? isFeatured;
//   int? productsCount;
//
//   BrandModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     this.isFeatured,
//     this.productsCount,
//   });
//
//   factory BrandModel.fromJson(Map<String, dynamic> json) {
//     return BrandModel(
//       id: json['id'] ?? '',
//       name: json['name'] ?? '',
//       image: json['image'] ?? '',
//       isFeatured: json['isFeatured'],
//       productsCount: json['productsCount'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'image': image,
//       'isFeatured': isFeatured,
//       'productsCount': productsCount,
//     };
//   }
// }
