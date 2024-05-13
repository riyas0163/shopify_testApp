
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCaregoryModel{
  final String brandId;
  final String categoryId;


  BrandCaregoryModel ({
    required this.brandId,
    required this.categoryId,
});

  Map<String, dynamic> toJson() {
    return {
      'brandId' : brandId,
      'categoryId' : categoryId,
    };
  }

  factory BrandCaregoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BrandCaregoryModel(
        brandId: data['brandId'] as String,
        categoryId: data['categoryId'] as String,
    );
  }
}