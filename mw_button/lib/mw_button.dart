library mw_button;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MWButton extends StatelessWidget {

Function? onPressed;
String text;
Color textColor = Colors.white;
Color? color;
IconData? iconData;
EdgeInsets? margin;
bool disabled = false;
int circularBorderRadius = 4;

MWButton({this.onPressed, required this.text, this.textColor = Colors.white, this.color, this.iconData, this.margin, this.disabled = false, this.circularBorderRadius = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
          child: InkWell(
              onTap: disabled ? null : onPressed as void Function()?,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    iconData!=null?
                    Padding(
                        padding: EdgeInsets.all(6),
                        child:Icon(iconData, color: textColor)
                    ): Container(),
                    Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(text, style:TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 14))
                    )
                  ]
              )
          ),
          color: Colors.transparent
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circularBorderRadius),
          color: disabled || color == null ? color!.withOpacity(0.8) : color
      )
    );
  }
}
