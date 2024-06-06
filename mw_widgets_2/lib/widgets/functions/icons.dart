import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

getThumbIcon(BuildContext context, IconData iconData, {double? size, Color? color}) {
  return Container(
      padding: EdgeInsets.all(size!=null?size/4:8),
      child: Icon(iconData,color: Colors.white, size:size),
      decoration: BoxDecoration(
          border: Border.all(color: color!=null?color.withOpacity(0.5):Theme.of(context).colorScheme.secondary,width: 1),
          color: color!=null?color:Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(size!=null?size+4:34)
      )
  );
}

getBorderedIcon(BuildContext context, IconData iconData, {double? maxHeight, Color? color, Color? borderColor}) {
  return Container(
      height: maxHeight,
      child:LayoutBuilder(builder: (context, constraint) {
        double biggest = constraint.biggest.height;
        return Container(
            width: biggest,
            height: biggest,
            padding: EdgeInsets.all(biggest/6),
            child: Icon(iconData, size: biggest*(2/3), color: Colors.white),
            decoration: BoxDecoration(
                border: Border.all(color: borderColor!=null?borderColor:Theme.of(context).colorScheme.secondary,width: 1),
                color: color!=null?color:Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(maxHeight!=null?maxHeight+4:34)
            )
        );
      })
  );
}

getFlexibleBorderedIcon(BuildContext context, IconData iconData, {double? maxHeight, Color? color, Color? borderColor}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Flexible(child: getBorderedIcon(context, iconData, maxHeight: maxHeight, color: color, borderColor: borderColor))
    ]
  );
}

getFlexibleIcon({IconData? icon, double? maxHeight, Color? color}) {
  return Flexible(child: Container(
      height: maxHeight,
      child:LayoutBuilder(builder: (context, constraint) {
        return Icon(icon, size:constraint.biggest.height, color: color != null ? color : Colors.blueGrey.shade300);
      }
      )
    )
  );
}
