// Adapter para el paquete skeletonizer
// Provee widgets básicos para mostrar skeletons/placeholders mientras se cargan datos

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// {@template skeleton_container}
/// Contenedor básico de skeleton con dimensiones configurables.
/// Usa el paquete skeletonizer internamente para mostrar un placeholder animado.
/// {@endtemplate}
class SkeletonContainer extends StatelessWidget {
  /// {@macro skeleton_container}
  const SkeletonContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.enabled = true,
  });

  /// Ancho del contenedor skeleton
  final double width;

  /// Alto del contenedor skeleton
  final double height;

  /// Radio de borde opcional (por defecto 8.0)
  final double? borderRadius;

  /// Si está habilitado el skeleton (por defecto true)
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
/// Widget de texto skeleton con ancho configurable.
/// Muestra una línea de skeleton para representar texto.
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

  /// Ancho del texto skeleton
  final double width;

  /// Alto del texto skeleton (por defecto 14)
  final double height;

  /// Radio de borde opcional (por defecto 4.0)
  final double? borderRadius;

  /// Si está habilitado el skeleton
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
/// Avatar circular skeleton.
/// {@endtemplate}
class SkeletonAvatar extends StatelessWidget {
  /// {@macro skeleton_avatar}
  const SkeletonAvatar({super.key, this.size = 40, this.enabled = true});

  /// Tamaño del avatar (diámetro)
  final double size;

  /// Si está habilitado el skeleton
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
/// Card skeleton completo con imagen y líneas de texto.
/// Útil para listas de movies, products, etc.
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

  /// Ancho de la imagen del skeleton
  final double imageWidth;

  /// Alto de la imagen del skeleton
  final double imageHeight;

  /// Si muestra subtítulo (línea secundaria de texto)
  final bool showSubtitle;

  /// Si está habilitado el skeleton
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Imagen skeleton
          Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          // Título skeleton
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
            // Subtítulo skeleton
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
