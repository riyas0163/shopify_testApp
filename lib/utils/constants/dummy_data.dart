
import 'package:shopify/features/shop/model/Brand_model.dart';
import 'package:shopify/features/shop/model/ProductAttributeModel.dart';
import 'package:shopify/features/shop/model/ProductVariation_Model.dart';
import 'package:shopify/features/shop/model/category_model.dart';
import 'package:shopify/features/shop/model/product_model.dart';
import 'package:shopify/routes/routers.dart';
import 'package:shopify/utils/constants/image_strings.dart';

import '../../features/shop/model/banner_modek.dart';

class TDummyData{


  /// list view categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Animals', image: Timages.animalicon, isFeatured: true),
    CategoryModel(id: '2', name: 'Cloths', image: Timages.clothicon, isFeatured: true),
    CategoryModel(id: '3', name: 'Electronics', image: Timages.electronicicon, isFeatured: true),
    CategoryModel(id: '4', name: 'Furniture', image: Timages.fournitureicon, isFeatured: true),
    CategoryModel(id: '5', name: 'Jewellery', image: Timages.jwelleryicon, isFeatured: true),
    CategoryModel(id: '6', name: 'Mackup', image: Timages.jwelleryicon, isFeatured: true),
    CategoryModel(id: '7', name: 'Shoes', image: Timages.shoesicon, isFeatured: true)
  ];


  /// banners
static final List<BannerModel> banners = [
  BannerModel(imageUrl: Timages.emailanimation, targetScreen: TRoutes.order, active: true),
  BannerModel(imageUrl: Timages.banner2, targetScreen: TRoutes.cart, active: true),
  BannerModel(imageUrl: Timages.banner3, targetScreen: TRoutes.favorites, active: true)
  ];


static final List<ProductModel> products = [
  ProductModel(
      id: '001',
      title: 'Green Nike sports shoes',
      stock: 14,
      price: 230,
     isFeatured: true,
      thumbnail: Timages.jwelleryicon, // image
      description: 'Green Nike sports shoes',
      brand: BrandModel(id: '1', name: 'Nike', image: Timages.img1,productCount: 300,isFeatured: true,),
      images: [Timages.banner3,Timages.img1,Timages.mackupkiticon,Timages.info],
      salePrice: 25,
      sku: 'ABR4561',
      categoryId: '1',
      productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Green,Black,Red']),
      ProductAttributeModel(name: 'Size' , values: ['EU 30, EU 32,EU 34'])
    ],
    productVariations: [
      ProductVariationModel(
          id: '1',
          stock: 12,
          price: 134,
          salePrice: 122.3,
          image: Timages.shoesicon ,
          description: 'This is a product description for green nike sports shoe',
          attributeValues: {'Color' : 'Green','Size' : 'EU 32'}),
      ProductVariationModel(
          id: '2',
          stock: 30,
          price: 568,
          image: Timages.banner2,
          attributeValues: {'Color' : 'Black','Size' : 'EU 34'}),
      ProductVariationModel(
          id: '3',
          stock: 0,
          price: 168,
          image: Timages.banner1,
          attributeValues: {'Color' : 'Red','Size' : 'EU 32'}),
      ProductVariationModel(
          id: '4',
          stock: 100,
          price: 868,
          image: Timages.banner1,
          attributeValues: {'Color' : 'Black','Size' : 'EU 32'}),
      ProductVariationModel(
          id: '5',
          stock: 60,
          price: 1-468,
          image: Timages.banner1,
          attributeValues: {'Color' : 'Red','Size' : 'EU 32'}),
      ProductVariationModel(
          id: '6',
          stock: 40,
          price: 668,
          image: Timages.banner1,
          attributeValues: {'Color' : 'Green','Size' : 'EU 32'}),

    ],
    productType: 'ProductType.variable'
  ),
  ProductModel(
    id: '002',
    title: 'Blue T-shirt for all ages',
    stock: 25,
    price: 56,
    thumbnail: Timages.clothicon,
    isFeatured: true,
    description: 'This is a product description for green nike sports shoe',
    brand: BrandModel(id: '5', name: 'ZARA', image: Timages.gpay),
    images: [Timages.fournitureicon,Timages.animalicon,Timages.facebook],
    salePrice: 40,
    sku: 'AKU1234',
    categoryId: '45',
    productAttributes: [
      ProductAttributeModel(name: 'Size',values: [ 'EU 32' , 'EU 34']),
      ProductAttributeModel(name: 'Color',values: ['Green' , 'Red', 'Blue'])
    ],
    productVariations: [
      ProductVariationModel(
          id: '1',
          stock: 12,
          price: 134,
          salePrice: 122.3,
          image: Timages.shoesicon ,
          description: 'This is a product description for green nike sports shoe',
          attributeValues: {'Color' : 'Green','Size' : 'EU 32'}),
      ProductVariationModel(
          id: '2',
          stock: 30,
          price: 568,
          image: Timages.banner2,
          attributeValues: {'Color' : 'Black','Size' : 'EU 34'}),
      ProductVariationModel(
          id: '3',
          stock: 0,
          price: 168,
          image: Timages.banner1,
          attributeValues: {'Color' : 'Red','Size' : 'EU 32'}),
      ProductVariationModel(
          id: '4',
          stock: 100,
          price: 868,
          image: Timages.banner1,
          attributeValues: {'Color' : 'Black','Size' : 'EU 32'}),
      ProductVariationModel(
          id: '5',
          stock: 60,
          price: 1-468,
          image: Timages.banner1,
          attributeValues: {'Color' : 'Red','Size' : 'EU 32'}),
      ProductVariationModel(
          id: '6',
          stock: 40,
          price: 668,
          image: Timages.banner1,
          attributeValues: {'Color' : 'Green','Size' : 'EU 32'}),

    ],
    productType: 'ProductType.single',
  ),
  ProductModel(
      id: '003',
      stock: 51,
      price: 125,
      title: '4 color collar t-shirt dry fit',
      thumbnail: Timages.clothicon,
    description: 'This a product description 4 color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else',
    brand: BrandModel(id: '5', name: 'ZARA', image: Timages.banner2),
    images: [Timages.fournitureicon,Timages.shoesicon,Timages.img1],
    salePrice: 30,
    sku: 'AXS4578',
    categoryId: '17',
    productAttributes: [
      ProductAttributeModel(name: 'Color',values: ['Red','Green','Black']),
      ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32','EU34']),
    ],
    productVariations: [
      ProductVariationModel(
          id: '1',
          stock: 34,
          price: 124,
          salePrice: 122.6,
          image: Timages.paytm,
          description: 'This is a product description for 4 color Collar t-shirt dry fit',
          attributeValues: {'Color' : 'Red' , 'Size' : ' EU 34'}),
      ProductVariationModel(id: '2',stock: 15,price: 145,image: Timages.gpay, attributeValues: {'Color' : 'Red','Size' : 'EU 32'}),
      ProductVariationModel(id: '3',stock: 45,price: 185,image: Timages.shoesicon, attributeValues: {'Color' : 'Yellow','Size' : 'EU 34'}),
      ProductVariationModel(id: '3',stock: 55,price: 145,image: Timages.gpay, attributeValues: {'Color' : 'Blue','Size' : 'EU 34'}),
      ProductVariationModel(id: '4',stock: 25,price: 135,image: Timages.google, attributeValues: {'Color' : 'Black','Size' : 'EU 34'}),
      ProductVariationModel(id: '5',stock: 5,price: 115,image: Timages.clothicon, attributeValues: {'Color' : 'Green','Size' : 'EU 34'}),
      ProductVariationModel(id: '6',stock: 145,price: 115,image: Timages.animalicon, attributeValues: {'Color' : 'Blue','Size' : 'EU 34'}),
    ],
    productType: 'ProductType.single',
  ),
  ProductModel(
    id: '004',
    stock: 51,
    price: 125,
    title: '4 color collar t-shirt dry fit',
    thumbnail: Timages.clothicon,
    description: 'This a product description 4 color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else',
    brand: BrandModel(id: '5', name: 'ZARA', image: Timages.banner2),
    images: [Timages.fournitureicon,Timages.shoesicon,Timages.img1],
    salePrice: 30,
    sku: 'AXS4578',
    categoryId: '17',
    productAttributes: [
      ProductAttributeModel(name: 'Color',values: ['Red','Green','Black']),
      ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32','EU34']),
    ],
    productVariations: [
      ProductVariationModel(
          id: '1',
          stock: 34,
          price: 124,
          salePrice: 122.6,
          image: Timages.paytm,
          description: 'This is a product description for 4 color Collar t-shirt dry fit',
          attributeValues: {'Color' : 'Red' , 'Size' : ' EU 34'}),
      ProductVariationModel(id: '2',stock: 15,price: 145,image: Timages.gpay, attributeValues: {'Color' : 'Red','Size' : 'EU 32'}),
      ProductVariationModel(id: '3',stock: 45,price: 185,image: Timages.shoesicon, attributeValues: {'Color' : 'Yellow','Size' : 'EU 34'}),
      ProductVariationModel(id: '3',stock: 55,price: 145,image: Timages.gpay, attributeValues: {'Color' : 'Blue','Size' : 'EU 34'}),
      ProductVariationModel(id: '4',stock: 25,price: 135,image: Timages.google, attributeValues: {'Color' : 'Black','Size' : 'EU 34'}),
      ProductVariationModel(id: '5',stock: 5,price: 115,image: Timages.clothicon, attributeValues: {'Color' : 'Green','Size' : 'EU 34'}),
      ProductVariationModel(id: '6',stock: 145,price: 115,image: Timages.animalicon, attributeValues: {'Color' : 'Blue','Size' : 'EU 34'}),
    ],
    productType: 'ProductType.single',
  ),

];






















}