// Adapter for the skeletonizer package
// Provides basic widgets to display skeletons/placeholders while data loads

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// {@template skeleton_container}
/// Basic skeleton container with configurable dimensions.
/// Uses the skeletonizer package internally to display an animated placeholder.
/// {@endtemplate}
class SkeletonContainer extends StatelessWidget {
  /// {@macro skeleton_container}
  const SkeletonContainer({
    required this.width,
    required this.height,
    this.borderRadius,
    this.enabled = true,
    super.key,
  });

  /// Skeleton container width
  final double width;

  /// Skeleton container height
  final double height;

  /// Optional border radius (defaults to 8.0)
  final double? borderRadius;

  /// Whether the skeleton is enabled (defaults to true)
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
      ),
    );
  }
}

/// {@template skeleton_text}
/// Skeleton text widget with configurable width.
/// Displays a skeleton line to represent text.
/// {@endtemplate}
class SkeletonText extends StatelessWidget {
  /// {@macro skeleton_text}
  const SkeletonText({
    super.key,
    this.width = 100,
    this.height = 14,
    this.borderRadius,
    this.enabled = true,
  });

  /// Skeleton text width
  final double width;

  /// Skeleton text height (defaults to 14)
  final double height;

  /// Optional border radius (defaults to 4.0)
  final double? borderRadius;

  /// Whether the skeleton is enabled
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
        ),
      ),
    );
  }
}

/// {@template skeleton_avatar}
/// Circular skeleton avatar.
/// {@endtemplate}
class SkeletonAvatar extends StatelessWidget {
  /// {@macro skeleton_avatar}
  const SkeletonAvatar({super.key, this.size = 40, this.enabled = true});

  /// Avatar size (diameter)
  final double size;

  /// Whether the skeleton is enabled
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

/// {@template skeleton_card}
/// Full skeleton card with image and text lines.
/// Useful for movie lists, product lists, etc.
/// {@endtemplate}
class SkeletonCard extends StatelessWidget {
  /// {@macro skeleton_card}
  const SkeletonCard({
    super.key,
    this.imageWidth = 120,
    this.imageHeight = 180,
    this.showSubtitle = true,
    this.enabled = true,
  });

  /// Skeleton image width
  final double imageWidth;

  /// Skeleton image height
  final double imageHeight;

  /// Whether a subtitle line is shown
  final bool showSubtitle;

  /// Whether the skeleton is enabled
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Skeleton image
          Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          // Skeleton title
          Container(
            width: imageWidth * 0.8,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          if (showSubtitle) ...[
            const SizedBox(height: 6),
            // Skeleton subtitle
            Container(
              width: imageWidth * 0.6,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
