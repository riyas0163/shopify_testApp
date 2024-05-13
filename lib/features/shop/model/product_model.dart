
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Brand_model.dart';
import 'ProductAttributeModel.dart';
import 'ProductVariation_Model.dart';

class ProductModel {
    String id;
    int stock;//
    String? sku;//
    double price;//
    String title;//
    DateTime? date;
    double salePrice;//
    String thumbnail;//
    bool? isFeatured;//
    BrandModel? brand;//
    String? description;//
    String? categoryId;//
    List<String>? images;//
    String? productType;//
    List<ProductAttributeModel>? productAttributes;//
    List<ProductVariationModel>? productVariations;//


  ProductModel ({
    required this.id,
    required this.stock,
    required this.price,
    required this.title,
    required this.thumbnail,
     this.productType,
     this.sku,
     this.date,
     this.salePrice = 0.0,
     this.isFeatured,
     this.brand,
     this.description,
     this.categoryId,
     this.images,
     this.productAttributes,
     this.productVariations
});


  static ProductModel empty() => ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');
  /// json format
  toJson() {
    return {
      'SKU' : sku,//
      'Title' : title,//
      'Stock' : stock,//
      'Price' : price,//
      'Images' : images ?? [] ,//
      'Thumbnail' :thumbnail,//
      'SalePrice' : salePrice,//
      'IsFeatured ' : isFeatured,//
      'CategoryId' :categoryId,//
      'Brand' : brand!.toJson(),//
      'Description' : description,//
      'ProductType' : productType,//
      'ProductAttributes' : productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],//
      'ProductVariations' : productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],//
    };
  }

  /// map json oriented document snapshot from firebase to model
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String ,dynamic>> document) {
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        sku: data['SKU'],//
        title: data['Title'],//
        stock: data['Stock'] ?? 0,//
        isFeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
        images: data['Image'] != null ? List<String>.from(data['Image']) : [],
        brand: BrandModel.fromJson(data['Brand']),

        productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList());
  }


  /// map Json oriented document snapshot from firebase to model

factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
        id: document.id,
        sku: data['SKU'] ?? '',
        stock: data['Stock'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        title: data['Title'] ?? '',
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Image'] != null ? List<String>.from(data['Image']): [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }



























}




//
// class ProductModel {
//   String id;
//   int stock;
//   String? sku;
//   double price;
//   String title;
//   DateTime? date;
//   double salePrice;
//   String thumbnail;
//   bool? isFeatured;
//   BrandModel? brand;
//   String? description;
//   String? categoryId;
//   List<String>? images;
//   String? productType;
//   List<ProductAttributeModel>? productAttributes;
//   List<ProductVariationModel>? productVariations;
//
//   ProductModel({
//     required this.id,
//     required this.stock,
//     this.sku,
//     required this.price,
//     required this.title,
//     this.date,
//     required this.salePrice,
//     required this.thumbnail,
//     this.isFeatured,
//     this.brand,
//     this.description,
//     this.categoryId,
//     this.images,
//     this.productType,
//     this.productAttributes,
//     this.productVariations,
//   });
//
//   factory ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
//     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//     return ProductModel(
//       id: snapshot.id,
//       stock: data['stock'] ?? 0,
//       sku: data['sku'],
//       price: data['price'] ?? 0.0,
//       title: data['title'] ?? '',
//       date: data['date'] != null ? (data['date'] as Timestamp).toDate() : null,
//       salePrice: data['salePrice'] ?? 0.0,
//       thumbnail: data['thumbnail'] ?? '',
//       isFeatured: data['isFeatured'],
//       brand: data['brand'] != null ? BrandModel.fromJson(data['brand']) : null,
//       description: data['description'],
//       categoryId: data['categoryId'],
//       images: data['images'] != null ? List<String>.from(data['images']) : null,
//       productType: data['productType'],
//       productAttributes: data['productAttributes'] != null
//           ? List<ProductAttributeModel>.from(data['productAttributes']
//           .map((x) => ProductAttributeModel.fromJson(x)))
//           : null,
//       productVariations: data['productVariations'] != null
//           ? List<ProductVariationModel>.from(data['productVariations']
//           .map((x) => ProductVariationModel.fromJson(x)))
//           : null,
//     );
//   }
//
//   static ProductModel empty() => ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '', salePrice: 0);
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'stock': stock,
//       'sku': sku,
//       'price': price,
//       'title': title,
//       'date': date?.toIso8601String(),
//       'salePrice': salePrice,
//       'thumbnail': thumbnail,
//       'isFeatured': isFeatured,
//       'brand': brand?.toJson(),
//       'description': description,
//       'categoryId': categoryId,
//       'images': images,
//       'productType': productType,
//       'productAttributes': productAttributes?.map((x) => x.toJson()).toList(),
//       'productVariations': productVariations?.map((x) => x.toJson()).toList(),
//     };
//   }
// }
