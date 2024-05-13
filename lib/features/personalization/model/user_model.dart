
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatterd/formatter.dart';

class Usermodel{
    String id;
  String firstName;
  String lastname;
    String username;
    String email;
  String phonenumber;
  String profilePicture;


  Usermodel(
  {
    required this.id,
    required this.firstName,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phonenumber,
    required this.profilePicture,

});

  factory Usermodel.fromJson(Map<String,dynamic> json) => Usermodel(
      id: json['id'],
      firstName: json['firstName'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
      phonenumber: json['phonenumber'],
      profilePicture: json['profilePicture']
  );

  /// factory method to create a Usermodel from a firebase document snapshot
  factory Usermodel.fromSnapshot(DocumentSnapshot<Map<String , dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      return Usermodel(
          id: document.id,
          firstName: data['firstName'] ?? '',
          lastname: data['lastname'] ?? '',
          username: data['username'] ?? '',
          email: data['email'] ?? '',
          phonenumber: data['phonenumber'] ?? '',
          profilePicture: data['profilePicture'] ?? ''
      );
    } else {
      return Usermodel.empty();
    }
  }

  Map<String,dynamic> toJson()=> {
    'id' : id,
    'firstName' : firstName,
    'lastname' : lastname,
    'username'  : username,
    'email'  : email,
    'phonenumber' : phonenumber,
    'profilePicture' : profilePicture,
  };

  static Usermodel fromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return Usermodel.fromJson(jsonMap);
  }

  static String toJsonString(Usermodel user) {
    Map<String, dynamic> jsonMap = user.toJson();
    return json.encode(jsonMap);
  }



/// helper function to get full name
String get fullname => '$firstName $lastname';

/// helper function to format phone number
String get formattedphoneno => TFormatter.formatphonenumber(phonenumber);


/// static function to split the full name to into first and last
static List<String> nameparts(fullname)=> fullname.split("");


/// generate a username from the full name
static String generateUsername(fullname) {
List<String> nameparts =  fullname.split("");
String firstname = nameparts[0].toLowerCase();
String lastname = nameparts.length > 1 ? nameparts[1].toLowerCase() : '';

String camelcaseusername = "$firstname$lastname";
String usernamewithprefix = "cwt_$camelcaseusername";
return usernamewithprefix;
}

// static function should be create for a empty user model

static Usermodel empty()=> Usermodel(id: '', firstName: '', lastname: '', username: '', email: '', phonenumber: '', profilePicture: '');

}



























