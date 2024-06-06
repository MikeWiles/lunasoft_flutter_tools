import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {

  String? title;
  Widget? customTitle;
  List<Widget>? actions = [];

  TitleBar({this.title ,this.actions, this.customTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            customTitle != null ?
            customTitle! :
            Text(title!,style: TextStyle(color: Theme.of(context).primaryColor))]
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(50,50);
}
