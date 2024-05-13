import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify/features/personalization/control/user_controller.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/shimmer/shimmer.dart';
import '../images/Circular_image.dart';

class Tuserprofile extends StatelessWidget {
  const Tuserprofile({
    super.key, required this.onpressed,
  });

  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController.instance);
    return ListTile(
      leading: Obx(() {
        final networkimage = controller.user.value.profilePicture;
        final image = networkimage.isNotEmpty
            ? networkimage
            : Timages.google;

        return controller.imageloader.value
            ? const TshimmersEffect(
          width: 60,
          height: 60,
          radious: 60,
        )
            : Tcircular_image(
            height: 80,
            width: 80,
            image: image,
            fit: BoxFit.fill,
            backgroundcolor: Colors.transparent,
            isnetworkimage: networkimage.isNotEmpty);
      }),
      title: Text(controller.user.value.fullname,style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
      trailing: IconButton(onPressed: onpressed,icon: const Icon(Icons.edit,color: Colors.white,),),
    );
  }
}