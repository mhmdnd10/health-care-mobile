import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RefreshData extends StatelessWidget {
  const RefreshData({super.key, required this.onRefresh, required this.child});
  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.green,
      strokeWidth: 4,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
