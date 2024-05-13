import 'package:intl/intl.dart';

class TFormatter{
  //customize the date format as needed
  static String formatdate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat("dd-mm-yyyy").format(date);
  }

  //customize the currency locale and symbol as needed
static String formatcurrency(double amount){
    return NumberFormat.currency(locale: 'en_US',symbol: '\$').format(amount);
}

static String formatphonenumber(String phonenumber){
    //assumimg a 10 - digit us phone number format:(123) 456-7890
  if(phonenumber.length ==10){
    return '(${phonenumber.substring(0,3)})${phonenumber.substring(3,6)} ${phonenumber.substring(6)}';
  } else if(phonenumber.length==11){
    return '(${phonenumber.substring(0,4)}) ${phonenumber.substring(4,7)} ${phonenumber.substring(7)}';
    //add more custom phone number formatting logic for diffrent formats if needed
  } return phonenumber;
}

  // static String internationalformat(String phonenumber){
  //   //remove any non-digit charcters from the phone number
  //   var digitOnly = phonenumber.replaceAll(RegExp(r'\D'), "");
  //
  //   //extract the cuntru coded fro the digitonly
  //   String countrycode = '+${digitOnly.substring(0,2)}';
  //   digitOnly = digitOnly.substring(2);
  //
  //   //add the remaining digits with proper formatting
  //   final formatternumber = StringBuffer();
  //   formatternumber.write('(${countrycode})');
  // }





















}