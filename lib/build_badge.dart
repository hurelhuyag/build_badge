library app_badge;

import 'dart:ui';

import 'package:flutter/widgets.dart';

/// This is The BuildBadge. You should use it over the MaterialApp or CupertinoApp.
class BuildBadge extends StatelessWidget {
  const BuildBadge({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.visible = true,
    required this.child,
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final bool visible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return child;
    }
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        fit: StackFit.expand,
        children: [
          child,
          Positioned(
            top: 0,
            left: 0,
            width: 50,
            height: 50,
            child: IgnorePointer(
              child: CustomPaint(
                painter: BannerPainter(
                  backgroundColor: backgroundColor,
                  textColor: textColor,
                  text: text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerPainter extends CustomPainter {
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const BannerPainter({
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = backgroundColor;

    final vertices = Vertices(VertexMode.triangles, const [
      Offset(30, 0),
      Offset(52, 0),
      Offset(0, 52),
      Offset(0, 52),
      Offset(0, 30),
      Offset(30, 0)
    ], colors: [
      backgroundColor,
      backgroundColor,
      backgroundColor,
      backgroundColor,
      backgroundColor,
      backgroundColor,
    ]);

    canvas.drawVertices(vertices, BlendMode.src, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: 11,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final width = textPainter.width;
    final halfWidth = width / 2;
    final x = 1 - halfWidth;

    canvas.translate(16, 16);
    canvas.rotate(-0.785398);

    textPainter.paint(canvas, Offset(x, 0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
