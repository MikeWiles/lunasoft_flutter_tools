import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OutlineButton extends StatelessWidget {

  Function? onPressed;
  String? text;
  Color? backgroundColor;
  Color? color;
  IconData? iconData;
  bool isLoading = false;
  EdgeInsets? margin;
  EdgeInsets? padding;
  MainAxisAlignment? mainAxisAlignment;

  OutlineButton({this.onPressed,
    required this.text,
    this.backgroundColor,
    this.color,
    this.iconData,
    this.isLoading = false,
    this.margin,
    this.padding,
    this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            border: Border.all(width:1, color: color == null ? Theme.of(context).primaryColor : color!),
            borderRadius: BorderRadius.circular(4),
            color: backgroundColor
        ),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: !isLoading ? onPressed as void Function()? : null,
                child:
                !isLoading ?
                Row(
                    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                    children:[
                      iconData!=null?
                      Padding(
                          padding: padding ?? const EdgeInsets.all(5),
                          child:Icon(iconData, color: color)
                      ): Container(),
                      Padding(
                          padding: padding ?? const EdgeInsets.all(5),
                          child: Text(text!, style:TextStyle(color: color == null ? Theme.of(context).primaryColor : color, fontWeight: FontWeight.w600, fontSize: 14))
                      )
                    ]
                ) :
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(child: CircularProgressIndicator())
                    )
                )
            )
        )
    );
  }
}
