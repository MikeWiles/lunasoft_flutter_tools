import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'outlineButton.dart';
class TopErrorPrompt extends StatefulWidget {
  bool? isVisible;
  final String? text;
  final Function? onClose;
  final Color? color;
  final Color? backgroundColor;

  TopErrorPrompt({required this.isVisible, this.text, this.onClose, this.color, this.backgroundColor});

  @override
  TopErrorPromptState createState() => TopErrorPromptState(this.isVisible, this.text, this.onClose, this.color, this.backgroundColor);
}

class TopErrorPromptState extends State<TopErrorPrompt> with SingleTickerProviderStateMixin{
  bool? isVisible;
  final String? text;
  final Function? onClose;
  final Color? color;
  final Color? backgroundColor;

  TopErrorPromptState(this.isVisible, this.text, this.onClose, this.color, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return SizeTransition(
          axisAlignment: 1,
          sizeFactor: animation,
          child: child,
        );
      },
      child: isVisible != true ? null : Container(
          height: isVisible == true ? null : 0.0,
          padding: EdgeInsets.all(isVisible == true ? 0 : 4),
          decoration: BoxDecoration(
              color: backgroundColor ?? Theme.of(context).canvasColor.withOpacity(0.75),
              border: Border(
                  bottom: BorderSide(color: color ?? Theme.of(context).colorScheme.error.withOpacity(0.75), width: 1)
              )
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                      "$text",
                      style: TextStyle(color: color ?? Theme.of(context).colorScheme.error, fontWeight: FontWeight.w600)
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: OutlineButton(
                        padding: const EdgeInsets.all(2),
                        onPressed: () {
                          if (onClose != null) {
                            onClose!();
                          }
                          setState(() {
                            isVisible = false;
                          });
                        },
                        text: "Close Prompt",
                        color: color ?? Theme.of(context).colorScheme.error
                    )
                )
              ]
          )
      ),
    );
  }
}
