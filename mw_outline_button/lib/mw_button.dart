library mw_raised_button;

import 'package:acs_soft_pay_flutter/enums/viewState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MWRaisedButton extends StatelessWidget {

Function? onPressed;
required String text;
Color textColor = Colors.white;
Color? color;
IconData? iconData;
EdgeInsets? margin;
bool disabled = false;

MWRaisedButton({this.onPressed, this.text, this.textColor = Colors.white, this.color, this.iconData, this.margin, this.disabled = false});

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
                        child: Text(text!, style:TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 14))
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
          border: Border.all(width:1, color: color),
          borderRadius: BorderRadius.circular(4),
          color: backgroundColor
      )
    );
  }
}
