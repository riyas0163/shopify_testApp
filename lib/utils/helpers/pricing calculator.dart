
class Tpricingcalculator{
  // calculate price on based tax anf shipping
  static double calculatetotalprice(double productprice , String location){
    double taxrate = gettaxrateforlocation(location);
    double taxamount = productprice *taxrate;

    double shippincost = getshippingcost(location);
    double totalprice = productprice + taxamount + shippincost;
    return totalprice;
  }


  //calculate shipping cost
  static String calclateshippingcost(double productprice , String location){
    double shippingcost = getshippingcost(location);
    return shippingcost.toStringAsFixed(2);
  }

  static String calculatetax(double productprice, String location){
    double taxrate = gettaxrateforlocation(location);
    double taxamount = productprice * taxrate;
    return taxamount.toStringAsFixed(2);
  }

  static double gettaxrateforlocation(String location){
    return 0.10;
  }

  static double getshippingcost(String location) {
    return 5.00;
  }

}