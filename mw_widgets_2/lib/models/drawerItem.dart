import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  Widget? fragment;
  Function? action;
  Color? color;
  int? pendingCount;
  bool? isDisabled;
  DrawerItem({ required this.title, required this.icon, this.fragment,this.action, this.color, this.pendingCount, this.isDisabled });
}
