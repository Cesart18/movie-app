import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({
    required this.width,
    required this.height,
    this.borderRadius,
    super.key,
  });

  final double width;
  final double height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        )
        .animate(
          onPlay: (controller) => controller.repeat(), // 🔁 bucle infinito
        )
        .shimmer(
          duration: 1000.ms,
          colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
        );
  }
}
