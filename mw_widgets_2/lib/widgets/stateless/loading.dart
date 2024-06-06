import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loading extends StatelessWidget {

  final Color? color;
  final double? height;
  final double? width;
  final String? text;

  Loading({this.height, this.width, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        color: color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                    alignment: Alignment.center,
                    children:<Widget>[
                      const SizedBox(width: 120,height: 120,child:CircularProgressIndicator()),
                      Container(
                          height: 110,
                          width: 110,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              border: Border.all(color:Theme.of(context).primaryColor,width:2)
                          ),
                          child: Text(text == null ? "Loading" : text!, style: Theme.of(context).textTheme.bodyLarge)
                      )
                    ]
                )
            )
          ],
        )
    );
  }
}
