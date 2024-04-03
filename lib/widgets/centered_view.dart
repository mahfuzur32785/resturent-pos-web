import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget? child;
  // const CenteredView({Key key, this.child}) : super(key: key);
  const CenteredView({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: double.infinity, maxHeight: double.infinity),
        child: child,
      ),
    );
  }
}
