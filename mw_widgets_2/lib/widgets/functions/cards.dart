import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mw_widgets/widgets/functions/icons.dart';

getCardContainer({Widget? child}) {
  return Container(
    margin: EdgeInsets.fromLTRB(5,5,5,0),
    child: child,
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), spreadRadius: 1, blurRadius: 2)],
      borderRadius: BorderRadius.circular(5),
      color: Colors.white.withOpacity(0.5)
    )
  );
}

Widget getGridItem(BuildContext context,
    {required String title,
      required IconData icon,
      required Function onTap,
      Color? color,
      int? pendingCount,
      bool? isDisabled,
      double size = 40}) {
  return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isDisabled == true ? null : Theme.of(context).canvasColor.withOpacity(0.5),
      ),
      child: Stack(
        children: [
          Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: isDisabled == true ? () {} : onTap as void Function()?,
                  child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        pendingCount == null ? Container()
                            :Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipOval(
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: pendingCount! > 9 ? 6 : 10),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.error
                                  ),
                                  child: Text("${pendingCount}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
                              ),
                            )
                        ),
                        Container(
                            alignment: Alignment.center,
                            child:Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: getThumbIcon(context, icon, size:size, color: color ?? Theme.of(context).primaryColor)
                                  ),
                                  Text(title,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Theme.of(context).primaryColorDark))
                                ]
                            )
                        )
                      ]
                  )
              )
          ),
          isDisabled == true ? Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).canvasColor.withOpacity(0.7),
                  )
              )
          ) : const SizedBox()
        ],
      )
  );
}
