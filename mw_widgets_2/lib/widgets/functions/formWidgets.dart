import 'package:mw_widgets/assets/fonts/externalFonts.dart';
import 'package:mw_widgets/helpers/formatting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getFieldAttribute(BuildContext context, String? name, String? value, {bool showNull = false, Color? nameColour}) {
  if(showNull == true || (value != null && value.trim() != "" && value.trim() != "null")) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        padding: const EdgeInsets.all(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(5),
                  child:Text(name!, textAlign: TextAlign.left, style: ExternalFonts.cardHeader1(nameColour ?? Theme.of(context).inputDecorationTheme.fillColor))
              ),
              Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(5),
                  child: Text(value ?? "None",style: ExternalFonts.cardContent1())
              )
            ]
        )
    );
  }
  return Container();
}

Widget getFieldContainer(BuildContext context, {required List<Widget> children, String? title, Color? backgroundColor, Color? outlineColor, Color? titleBackground, Color? titleColor}) {
  List<Widget> contents = [];
  if (title != null) {
    contents.add(getFormTitle(context, title, backgroundColor: titleBackground, color: titleColor));
  }
  contents.add(
      Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
        child:Column(
            children: children
        ),
      )
  );
  return Container(
      margin: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: outlineColor ?? titleBackground ?? Theme.of(context).colorScheme.secondary, width: 1)
      ),
      child: Column(
        children: contents,
      )
  );
}

Widget getFormTitle(BuildContext context,String title, { Color? backgroundColor, Color? color }) {
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.2), topRight: Radius.circular(4.2))
      ),
      child:Text(title, style: TextStyle(fontSize: 22, color: color ?? Colors.white))
  );
}

Widget getNoItems(IconData iconData, String text) {
  return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children:<Widget>[
        Icon(iconData, color: Colors.black.withOpacity(0.7)),
        Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black.withOpacity(0.7)))
      ]
  );
}

Widget getFieldFormFromMap({required BuildContext context, String? title, required Map<String, dynamic> map, bool showNull = false, Color? nameColour, Color? backgroundColor, Color? titleColor, Color? titleBackground, Color? outlineColor, List<String>? includedKeys, List<String>? excludedKeys}) {
  List<Widget> items = [];
  map.forEach((key, value) {
    if ((includedKeys == null || includedKeys.contains(key)) || (excludedKeys == null || !excludedKeys.contains(key))) {
      items.add(
          getFieldAttribute(context, formatFirstLetterCapital(key), value.toString(), showNull: showNull, nameColour: nameColour)
      );
    }
  });
  return getFieldContainer(
    context,
    title: title,
    children: items,
    backgroundColor: backgroundColor,
    titleBackground: titleBackground,
    titleColor: titleColor,
    outlineColor: outlineColor
  );
}

List<Widget> getWidgetListFromMap({required BuildContext context, required Map<String, dynamic> map, bool showNull = false, List<String>? includedKeys, List<String>? excludedKeys}) {
  List<Widget> items = [];
  map.forEach((key, value) {
    if ((includedKeys == null || includedKeys.contains(key)) || (excludedKeys == null || !excludedKeys.contains(key))) {
      items.add(
          getFieldAttribute(context, formatFirstLetterCapital(formatSpaceAtCapital(key, convertToLowercase: true)), value.toString(), showNull: showNull)
      );
    }
  });
  return items;
}

Widget getErrorWidget(String? error, Color color) {
  return Container(
      padding: const EdgeInsets.all(12),
      width: double.maxFinite,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: color, size: 60),
            Text(error ?? "A connection error occurred",
                textAlign: TextAlign.center,
                style: ExternalFonts.cardHeader1(color))
          ]));
}
