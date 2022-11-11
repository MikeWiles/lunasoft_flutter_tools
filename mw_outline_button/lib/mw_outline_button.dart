library mw_raised_button;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MWOutlineButton extends StatelessWidget {

  Function? onPressed;
  String? text;
  Color? backgroundColor;
  Color? color;
  IconData? iconData;
  bool isLoading = false;
  EdgeInsets? margin;
  MainAxisAlignment? mainAxisAlignment;

MWOutlineButton({this.onPressed,
  required this.text,
  this.backgroundColor,
  this.color,
  this.iconData,
  this.isLoading = false,
  this.margin,
  this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(2),
      child: Material(
          child: InkWell(
              onTap: !isLoading ? onPressed as void Function()? : null,
              child:
              !isLoading ?
              Row(
                  mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                  children:[
                    iconData!=null?
                    Padding(
                        padding: EdgeInsets.all(5),
                        child:Icon(iconData, color: color)
                    ): Container(),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(text!, style:TextStyle(color: color == null ? Theme.of(context).primaryColor : color, fontWeight: FontWeight.w600, fontSize: 14))
                    )
                  ]
              ) :
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(child: CircularProgressIndicator())
                  )
              )
          ),
          color: Colors.transparent
      ),
      decoration: BoxDecoration(
          border: Border.all(width:1, color: color == null ? Theme.of(context).primaryColor : color!),
          borderRadius: BorderRadius.circular(4),
          color: backgroundColor
      )
    );
  }
}
