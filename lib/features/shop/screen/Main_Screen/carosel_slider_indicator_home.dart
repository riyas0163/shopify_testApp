import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shopify/features/shop/control/banner_controller.dart';
import 'package:shopify/utils/shimmer/shimmer.dart';
import '../../../../common/widgets/images/carosel_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class carosel_slider_indicator extends StatelessWidget {
  const carosel_slider_indicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // loader
      if(controller.isLoading.value ) return const TshimmersEffect(width: double.infinity, height: 190);
     // print(controller.banners);
      // no data found
      if(controller.banners.isEmpty){
        return const Center(child: Text('no data found'),);
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(viewportFraction: 1, autoPlay: true, onPageChanged: (index, _) => controller.updatepageindicator(index)),
              items: controller.banners.map((banner) =>
                  TRoundedimage(
                imageurl: banner.imageUrl,
                insnetworkimage: true,
                  onpressed: () => Get.toNamed(banner.targetScreen),)

              ).toList(),

              // [
              //   body_roundedimage(imageurl: Timages.banner1,),
              //   body_roundedimage(imageurl: Timages.banner2,),
              //   body_roundedimage(imageurl: Timages.banner3,),
              // ],
            ),
            Image.network(
              'https://example.com/path/to/your/png/image.png',
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child; // Show the image if it's loaded successfully
                } else {
                  return const CircularProgressIndicator(); // Show a loading indicator while the image is loading
                }
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Text(''); // Display an error message if image loading fails
              },
            ),

            const SizedBox(
              height: Tsizes.md,
            ),
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: circularIntegator(
                        width: 20,
                        height: 5,
                        backgroundcolor: controller.caroselCurrentindex.value == i
                            ? Tcolors.primary
                            : Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }



    });
  }
}
