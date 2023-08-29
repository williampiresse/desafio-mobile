import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerWidget.rectagular({
    this.width = double.infinity,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.greenAccent,
      highlightColor: Colors.yellowAccent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
      ),
    );
  }
}
