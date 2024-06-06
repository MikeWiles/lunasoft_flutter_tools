import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mw_widgets/enums/viewState.dart';

import 'loading.dart';

class LoadingOverlay extends StatelessWidget {

  final Widget? child;
  final Widget Function(ViewState?)? contentBuilder;
  final Stream<ViewState>? stream;
  final bool? dynamicHeight;

  LoadingOverlay({this.stream, this.contentBuilder, this.child, this.dynamicHeight});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return StreamBuilder(
        initialData: ViewState.Success,
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<ViewState> snapshot) {
          return Stack(children: <Widget>[
            child != null ? child! : const SizedBox(),
            contentBuilder != null ? contentBuilder!(snapshot.data) : const SizedBox(),
            snapshot.data!=ViewState.Loading?Container():
            Loading(
              width: screenSize.width,
              height: dynamicHeight != true ? screenSize.height: null,
              color: dynamicHeight != true ? const Color.fromRGBO(255, 255, 255,0.4): null
            )
          ]
        );
      });
  }
}
