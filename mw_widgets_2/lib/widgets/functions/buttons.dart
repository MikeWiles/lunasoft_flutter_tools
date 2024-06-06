import 'package:mw_widgets/models/drawerItem.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import 'package:mw_widgets/widgets/functions/cards.dart';

import 'icons.dart';

Widget getHomeItem(BuildContext context, { required DrawerItem item, required Function onTap, double size = 40, bool? isDisabled }) {
  return getGridItem(
      context,
      title: item.title,
      icon: item.icon,
      color: item.color,
      pendingCount: item.pendingCount,
      onTap: onTap,
      size: size,
      isDisabled: isDisabled
  );
}
