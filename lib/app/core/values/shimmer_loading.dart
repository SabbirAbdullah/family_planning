import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgets {
  static Widget shimmerCard({double height = 60}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
      ),
    );
  }

  static Widget shimmerBlock({int count = 1, double height = 60}) {
    return Column(
      children: List.generate(count, (index) => shimmerCard(height: height)),
    );
  }

  static Widget shimmerRowBlocks({int count = 2, double height = 60}) {
    return Row(
      children: List.generate(
        count,
            (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: shimmerCard(height: height),
          ),
        ),
      ),
    );
  }
}
