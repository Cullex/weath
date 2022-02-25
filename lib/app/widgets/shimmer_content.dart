import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContent extends StatelessWidget {
  const ShimmerContent(this.child, {this.loading = false, Key? key})
      : super(key: key);

  final Widget child;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Shimmer.fromColors(
            highlightColor: Colors.grey.shade900,
            baseColor: Colors.black,
            child: child,
          )
        : child;
  }
}
