import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImage extends StatelessWidget {
  CustomImage(
      {this.imageUrl,
      this.size,
      this.padding = 0,
      this.hasBorder = false,
      this.borderColour,
      this.icon,
      this.localFile,
      this.isOval = false,
      this.height,
      this.width});

  String? imageUrl;
  File? localFile;
  bool hasBorder = true, isOval = true;
  double? size, height, width, padding;
  Color? borderColour;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(padding!),
            child: Container(
                child: SizedBox(
                  width: width ?? size ?? double.maxFinite,
                  height: height ?? size,
                  child: Center(
                    child: isOval == true
                        ? ClipOval(child: _getImageWidget())
                        : ClipRRect(
                            child: _getImageWidget(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                  ),
                ),
                decoration: getBoxDecoration(context))));
  }

  BoxDecoration getBoxDecoration(BuildContext context) {
    Color? colour;

    if (borderColour == null) {
      colour = Theme.of(context).primaryColor;
    } else {
      colour = borderColour;
    }

    if (hasBorder == true && colour != null) {
      return BoxDecoration(
          shape: isOval == true ? BoxShape.circle : BoxShape.rectangle,
          border: Border.all(color: colour, width: 2),
          borderRadius: isOval == true ? null : BorderRadius.circular(7));
    } else {
      return const BoxDecoration();
    }
  }

  Widget? _getImageWidget() {
    if (localFile != null) {
      return Container(
          width: size ?? double.maxFinite,
          height: size,
          child: Image.file(localFile!, fit: BoxFit.cover));
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.toLowerCase().contains("http")) {
        return CachedNetworkImage(
          width: width ?? (size ?? double.maxFinite),
          height: height ?? size,
          imageUrl: imageUrl!,
          fit: BoxFit.contain,
          placeholder: (context, url) => Container(
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                  height: height ?? size,
                  width: height ?? size,
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color?>(
                          borderColour ?? Theme.of(context).primaryColor)))),
          errorWidget: (context, url, error) => _getErrorWidget()!,
        );
      }
      if (imageUrl!.toLowerCase().contains(".png") ||
          imageUrl!.toLowerCase().contains(".jpg") ||
          imageUrl!.toLowerCase().contains(".jpeg")) {
        return Image.asset(imageUrl!, fit: BoxFit.fitHeight, height: size);
      } else {
        return SvgPicture.asset(imageUrl!,
            color: borderColour, width: width ?? size, height: height);
      }
    } else if (icon == null) {
      return LayoutBuilder(builder: (context, constraint) {
        return Icon(Icons.image, size: size ?? constraint.biggest.height);
      });
    } else {
      return icon;
    }
  }

  Widget? _getErrorWidget() {
    if (icon != null) {
      return icon;
    }
    return Container();
  }
}
