import 'dart:math';

import "package:flutter/material.dart";

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_RADIUS_WITH_MARGIN = AVATAR_RADIUS + 6;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Column(
        children: [
          SizedBox(
            height: CURVE_HEIGHT,
            child: Stack(
              children: <Widget>[
                CurvedShape(Colors.blue[700]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars2.githubusercontent.com/u/8615768?s=460&v=4'),
                    radius: AVATAR_RADIUS,
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 2),
              child: Text(
                'tarek360',
                style: Theme.of(context).textTheme.title,
              )),
          Text(
            'Software Developer',
            style: Theme.of(context).textTheme.body1,
          ),
          SizedBox(height: 16)
        ],
      ),
    );
  }
}

class CurvedShape extends StatelessWidget {
  CurvedShape(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, CURVE_HEIGHT),
      painter: _CurvedShapePainter(color),
    );
  }
}

class _CurvedShapePainter extends CustomPainter {
  _CurvedShapePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = color;

    Offset circleCenter = Offset(size.width / 2, size.height - AVATAR_RADIUS);

    Offset topLeft = Offset(0, 0);
    Offset bottomLeft = Offset(0, size.height * 0.25);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height * 0.5);

    Offset leftCurveControlPoint = Offset(
        circleCenter.dx * 0.5, size.height - AVATAR_RADIUS_WITH_MARGIN * 1.35);
    Offset rightCurveControlPoint =
        Offset(circleCenter.dx * 1.7, size.height - AVATAR_RADIUS_WITH_MARGIN);

    final arcStartAngle = 200 / 180 * pi;
    final avatarLeftPointX =
        circleCenter.dx + AVATAR_RADIUS_WITH_MARGIN * cos(arcStartAngle);
    final avatarLeftPointY =
        circleCenter.dy + AVATAR_RADIUS_WITH_MARGIN * sin(arcStartAngle);
    Offset avatarLeftPoint =
        Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

    final arcEndAngle = -5 / 180 * pi;
    final avatarRightPointX =
        circleCenter.dx + AVATAR_RADIUS_WITH_MARGIN * cos(arcEndAngle);
    final avatarRightPointY =
        circleCenter.dy + AVATAR_RADIUS_WITH_MARGIN * sin(arcEndAngle);
    Offset avatarRightPoint = Offset(
        avatarRightPointX, avatarRightPointY); // the right point of the arc

    Path path = Path()
      ..moveTo(topLeft.dx,
          topLeft.dy) // this move isn't required since the start point is (0,0)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy,
          avatarLeftPoint.dx, avatarLeftPoint.dy)
      ..arcToPoint(avatarRightPoint,
          radius: Radius.circular(AVATAR_RADIUS_WITH_MARGIN))
      ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy,
          bottomRight.dx, bottomRight.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CurvedShapePainter old) => old.color != color;
}
