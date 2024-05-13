
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class THelperfunctions{
  static Color? getcolor(String value){

    if(value=='green'){
      return Colors.green;
    }else if(value=='green'){
      return Colors.green;
    }else if(value=='Red'){
      return Colors.red;
    }else if(value=='Blue'){
      return Colors.blueAccent;
    }else if(value=='pink'){
      return Colors.pink;
    }else if(value== 'grey'){
      return Colors.grey;
    }else if(value=='purple'){
      return Colors.purple;
    }else if(value== 'black'){
      return Colors.black;
    }else if(value=='white'){
      return Colors.white;
    }else if(value=='brown'){
      return Colors.brown;
    }else if(value=='teal'){
      return Colors.teal;
    }else if(value == 'indigo'){
      return Colors.indigo;
    }else {
      return null;
    }
  }



  static void showsnackbar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showalert(String title,String message){
    showDialog(context: Get.context!,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: ()=>Navigator.of(context).pop(), child: const Text("OK"))
        ],
      );
        });
  }

  static void navigatetoscreen(BuildContext context, Widget screen){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>screen) );
  }

  static String truncatetext(String text,int maxlength){
    if(text.length<= maxlength){
      return text;
    }else {
      return text.substring(0,maxlength);
    }
  }

  static bool isdarkmode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  // static Size screenSize(){
  //   return MediaQuery.of(Get.context!).size;
  // }

static double screenheight() {
    return MediaQuery.of(Get.context!).size.height;
}

static double screenwidth(){
    return MediaQuery.of(Get.context!).size.width;
}
 static String getformatedate(DateTime date,{String format ='dd MM yyyy'}){
    return DateFormat(format).format(date);
 }

static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
}

static List<Widget> wropwidgets(List<Widget> widgets,int rowsize){
    final wrappedlist =<Widget>[];
    for(var i = 0;i < widgets.length;i+= rowsize){
      final rowchildren = widgets.sublist(i, i + rowsize > widgets.length ? widgets.length : i + rowsize);
      wrappedlist.add(Row(children: rowchildren,));
    }
    return wrappedlist;
}
}




















