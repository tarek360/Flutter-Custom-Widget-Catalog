import 'package:flutter/material.dart';

class VectorIcon extends StatelessWidget {
  final VectorIconData data;
  final Color color;
  final double size;

  VectorIcon(this.data, {this.color, this.size});

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double iconSize = size ?? iconTheme.size;
    final double iconOpacity = iconTheme.opacity;
    Color iconColor = color ?? iconTheme.color;
    if (iconOpacity != 1.0)
      iconColor = iconColor.withOpacity(iconColor.opacity * iconOpacity);

    return CustomPaint(
      size: Size(iconSize, iconSize),
      painter: _VectorIconPainter(data, iconColor),
    );
  }
}

class _VectorIconPainter extends CustomPainter {
  _VectorIconPainter(this.iconData, this.fillColor);

  final VectorIconData iconData;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = fillColor;
    canvas.scale(
        size.width / iconData.size.width, size.height / iconData.size.height);
    canvas.drawPath(iconData.path, paint);
  }

  @override
  bool shouldRepaint(_VectorIconPainter old) => old.iconData != iconData;
}

abstract class VectorIconData {
  Path get path;

  Size get size;
}
