import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageFromNetwork extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const ImageFromNetwork({
    super.key,
    required this.imageUrl,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (context, url, error) {
        return const Icon(
          FontAwesomeIcons.circleXmark,
          size: 30,
        );
      },
    );
  }
}
