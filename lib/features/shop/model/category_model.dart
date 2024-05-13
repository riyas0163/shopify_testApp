
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String id;
  String name;
  String image;
  String parentid;
  bool isFeatured;


  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
     this.parentid ='', /// is null so we can use empty string .we can use dark method empty or  not method
    required this.isFeatured,
});


  /// empty helper function
static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// convert model to Json structure  so that you can store data in firebase

  /// dart json actually call as a map key value pair
 Map<String,dynamic> toJson(){
    return {
      'Name' : name,
      'Image' : image,
      'ParentId' : parentid,
      'IsFeatured' : isFeatured,
    };
  }


  /// map Json oriented document snapshot from firebase to UserModel
/// if you are using multiple constructor use factory method

  /// using factory key to create a diffrenet model using .
factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
   if(document.data() != null) {
     final data = document.data()!;


     /// map JSON record to the model ... if != null return the data
     /// document.id is second column
     /// document.data is field
     return CategoryModel(
         id: document.id,
         name: data['Name'] ?? '',
         image: data['Image'] ?? '',
         isFeatured: data['IsFeatured'] ?? false,

     );
   } else {
     return CategoryModel.empty(); /// if documentsnap data is null return empty contracture
   }
}



















}