import 'package:mw_widgets/models/drawerItem.dart';
import 'package:flutter/material.dart';

class StepperBar extends StatelessWidget implements PreferredSizeWidget {

  List<DrawerItem>? items = [];
  int? currentIndex = 0;
  Color? activeColor;
  Color? inactiveColor;

  StepperBar(this.items,this.currentIndex,{this.activeColor, this.inactiveColor});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: items!.map((i) => getStepWidget(context, items!.indexOf(i))).toList()
              )
          )
        ]
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(50,50);

  Widget getStepWidget(BuildContext context, int index) {
    if(index != currentIndex) {
      return Padding(
        padding: EdgeInsets.all(10),
        child:ClipOval(
          child: Container(
            color: inactiveColor ?? Theme.of(context).canvasColor,
            height: 10,
            width: 10,
          )
        )
      );
    }
    return Padding(
      padding: EdgeInsets.all(10),
      child: ClipOval(
        child: Container(
          color: activeColor ?? Theme.of(context).colorScheme.secondary,
          height: 15,
          width: 15,
        )
      )
    );
  }
}
