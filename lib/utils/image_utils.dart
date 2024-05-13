// import 'dart:async';
// import 'dart:ui' as ui;
// import 'package:flutter/widgets.dart';
//
// class ImageUtils {
//   static Future<ui.Codec> loadImageCodec(String imageUrl) async {
//     final completer = Completer<ui.Codec>();
//     final image = NetworkImage(imageUrl);
//     final loadStream = image.resolve(const ImageConfiguration());
//
//     loadStream.addListener(
//       ImageStreamListener(
//             (info, _) async {
//           print('Image loading: ${info.image}'); // Debug print to check image loading
//           try {
//             final codec = await ui.createImageCodecFromUrl(info.image.toString());
//             completer.complete(codec);
//           } catch (e) {
//             completer.completeError('Error creating image codec: $e');
//           }
//         },
//         onError: (dynamic error, StackTrace? stackTrace) {
//           completer.completeError(error, stackTrace);
//         },
//       ),
//     );
//
//     return completer.future;
//   }
// }
