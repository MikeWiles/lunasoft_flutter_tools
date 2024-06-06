import "package:flutter/material.dart";

void showSnackBarWithOptions(String? message, Color colour, {BuildContext? context, GlobalKey<ScaffoldState>? scaffoldKey, IconData? icon}) {
  if(context == null && scaffoldKey != null) {
    context = scaffoldKey.currentContext;
  }
  ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
          content: Container(
              height: 40,
              child:Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:<Widget>[
                    icon!=null?Container(margin: const EdgeInsets.all(2) ,child:Icon(icon, color: Colors.white)):Container(),Text(message!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600))]
              )
          ),
          backgroundColor: colour
      )
  );
}

void showSuccessSnackBar(String message, {BuildContext? context, GlobalKey<ScaffoldState>? scaffoldKey, IconData icon = Icons.check}) {
  showSnackBarWithOptions(message, Colors.green, context:context, scaffoldKey: scaffoldKey, icon: icon);
}

void showWarningSnackBar(String message, {BuildContext? context, GlobalKey<ScaffoldState>? scaffoldKey, IconData icon = Icons.warning}) {
  showSnackBarWithOptions(message, Colors.orange, context:context, scaffoldKey: scaffoldKey, icon: icon);
}

void showErrorSnackBar(String? message, {BuildContext? context, GlobalKey<ScaffoldState>? scaffoldKey, IconData icon = Icons.error}) {
  showSnackBarWithOptions(message, Colors.red, context:context, scaffoldKey: scaffoldKey, icon: icon);
}

void showServerErrorSnackBar(BuildContext context,e, {String? altMessage}) {
  String errMessage = "Could not connect";
  if(e?.response?.data != null) {
    errMessage = e.response.data["error"].toString();
  } else if(altMessage != null) {
    errMessage = altMessage;
  }
  showSnackBarWithOptions(errMessage, Colors.redAccent, context: context, icon:Icons.error_outline);
}