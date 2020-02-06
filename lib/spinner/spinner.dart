import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Spinner extends StatefulWidget {
  final double size;

  Spinner({this.size});

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Offset _c1 = Offset(1.0, 0.5);
  Offset _c2 = Offset(0.75, 0.5);
  Offset _c3 = Offset(0.5, 0.5);
  Offset _c4 = Offset(0.25, 0.5);
  Offset _c5 = Offset(0.0, 0.5);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);

    AnimationSet _animationSet = AnimationSet(_controller);

    _controller.addListener(() {
      if (_controller.value < 0.8) {
        _c1 = _animationSet.c1p1.value;
      } else {
        _c1 = _animationSet.c1p2.value;
      }

      if (_controller.value < 0.6) {
        _c2 = _animationSet.c2p1.value;
      } else if (_controller.value < 0.8) {
        _c2 = _animationSet.c2p2.value;
      } else {
        _c2 = _animationSet.c2p3.value;
      }

      if (_controller.value < 0.4) {
        _c3 = _animationSet.c3p1.value;
      } else if (_controller.value < 0.6) {
        _c3 = _animationSet.c3p2.value;
      } else {
        _c3 = _animationSet.c3p3.value;
      }

      if (_controller.value < 0.2) {
        _c4 = _animationSet.c4p1.value;
      } else if (_controller.value < 0.4) {
        _c4 = _animationSet.c4p2.value;
      } else {
        _c4 = _animationSet.c4p3.value;
      }

      if (_controller.value < 0.2) {
        _c5 = _animationSet.c5p1.value;
      } else {
        _c5 = _animationSet.c5p2.value;
      }

      setState(() {});
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size =
        widget.size != null ? Size(widget.size, widget.size) : Size(100, 100);
    return CustomPaint(
      size: size,
      painter: _SpinnerPainter(_c1, _c2, _c3, _c4, _c5),
    );
  }
}

class AnimationSet {
  static Curve _curveOfCurve = Cubic(.51, .23, .99, .38);

  AnimationSet(this.controller)
      :
        // ********** C1 **********
        c1p1 = _OffsetTween(Offset(1.0, 0.5), Offset(0.0, 0.5))
            .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.8,
            curve: Curves.linear,
          ),
        )),
        c1p2 = _CurveTween().animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.8,
              1.0,
              curve: _curveOfCurve,
            ),
          ),
        ),

        // ********** C2 **********
        c2p1 = _OffsetTween(Offset(0.75, 0.5), Offset(0.0, 0.5))
            .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.6,
            curve: Curves.linear,
          ),
        )),
        c2p2 = _CurveTween().animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.6,
              0.8,
              curve: _curveOfCurve,
            ),
          ),
        ),
        c2p3 = _OffsetTween(Offset(1.0, 0.5), Offset(0.75, 0.5)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.8,
              1.0,
              curve: Curves.linear,
            ),
          ),
        ),

        // ********** C3 **********
        c3p1 = _OffsetTween(Offset(0.5, 0.5), Offset(0.0, 0.5))
            .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.4,
            curve: Curves.linear,
          ),
        )),
        c3p2 = _CurveTween().animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.4,
              0.6,
              curve: _curveOfCurve,
            ),
          ),
        ),
        c3p3 = _OffsetTween(Offset(1.0, 0.5), Offset(0.5, 0.5)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.6,
              1.0,
              curve: Curves.linear,
            ),
          ),
        ),

        // ********** C4 **********
        c4p1 = _OffsetTween(Offset(0.25, 0.5), Offset(0.0, 0.5))
            .animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0,
            0.2,
            curve: Curves.linear,
          ),
        )),
        c4p2 = _CurveTween().animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.2,
              0.4,
              curve: _curveOfCurve,
            ),
          ),
        ),
        c4p3 = _OffsetTween(Offset(1.0, 0.5), Offset(0.25, 0.5)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.4,
              1.0,
              curve: Curves.linear,
            ),
          ),
        ),

        // ********** C5 **********
        c5p1 = _CurveTween().animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.2,
              curve: _curveOfCurve,
            ),
          ),
        ),
        c5p2 = _OffsetTween(Offset(1.0, 0.5), Offset(0.0, 0.5)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.2,
              1.0,
              curve: Curves.linear,
            ),
          ),
        );

  final AnimationController controller;

  final Animation<Offset> c1p1;
  final Animation<Offset> c1p2;

  final Animation<Offset> c2p1;
  final Animation<Offset> c2p2;
  final Animation<Offset> c2p3;

  final Animation<Offset> c3p1;
  final Animation<Offset> c3p2;
  final Animation<Offset> c3p3;

  final Animation<Offset> c4p1;
  final Animation<Offset> c4p2;
  final Animation<Offset> c4p3;

  final Animation<Offset> c5p1;
  final Animation<Offset> c5p2;
}

class _CurveTween extends Tween<Offset> {
  static Rect _bounds = Rect.fromLTWH(0, 0, 1, 1);

  PathMetric metric = (Path()
        ..moveTo(_bounds.centerLeft.dx, _bounds.centerLeft.dy)
        ..quadraticBezierTo(_bounds.topCenter.dx, _bounds.topCenter.dy,
            _bounds.centerRight.dx, _bounds.centerRight.dy))
      .computeMetrics()
      .first;

  _CurveTween() : super(begin: _bounds.centerLeft, end: _bounds.centerRight);

  // this only for web, at the meanwhile getTangentForOffset() doesn't work on web.
  final points = [
    Offset(0.00034370459616184235, 0.49965640902519226),
    Offset(0.008645057678222656, 0.4914296865463257),
    Offset(0.016522541642189026, 0.48375046253204346),
    Offset(0.026747584342956543, 0.47396785020828247),
    Offset(0.03920118510723114, 0.4623355567455292),
    Offset(0.05305829644203186, 0.4497568905353546),
    Offset(0.0687340497970581, 0.4359903335571289),
    Offset(0.08699409663677216, 0.420573890209198),
    Offset(0.14971010386943817, 0.37270301580429077),
    Offset(0.1730450689792633, 0.3568994998931885),
    Offset(0.19756782054901123, 0.3414652347564697),
    Offset(0.2244195193052292, 0.32594460248947144),
    Offset(0.2510514557361603, 0.311975359916687),
    Offset(0.279885470867157, 0.29845041036605835),
    Offset(0.3095579147338867, 0.2862681746482849),
    Offset(0.33994975686073303, 0.2756160497665405),
    Offset(0.3723630905151367, 0.26629120111465454),
    Offset(0.4038558006286621, 0.2592437267303467),
    Offset(0.43861454725265503, 0.2537681758403778),
    Offset(0.4736436605453491, 0.2506946623325348),
    Offset(0.5087886452674866, 0.2500772476196289),
    Offset(0.5438950061798096, 0.2519267797470093),
    Offset(0.5817041397094727, 0.2566755712032318),
    Offset(0.61909019947052, 0.2641824781894684),
    Offset(0.6586536169052124, 0.2751709818840027),
    Offset(0.6999670267105103, 0.28998681902885437),
    Offset(0.7398722767829895, 0.3075386881828308),
    Offset(0.7830148935317993, 0.3300974369049072),
    Offset(0.8235219717025757, 0.35466647148132324),
    Offset(0.8672077059745789, 0.3848415017127991),
    Offset(0.9112566709518433, 0.4191320538520813),
    Offset(0.95703125, 0.4588775634765625),
  ];

  @override
  Offset lerp(double time) {
    if (kIsWeb) {
      return points[(time * points.length).toInt().clamp(0, points.length - 1)];
    } else {
      return metric.getTangentForOffset(time * metric.length).position;
    }
  }
}

class _OffsetTween extends Tween<Offset> {
  _OffsetTween(Offset begin, Offset end) : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    return Offset.lerp(begin, end, t);
  }
}

class _SpinnerPainter extends CustomPainter {
  static Color _red = Color(0xFFff2938);
  static Color _yellow = Color(0xFFfdb812);
  static Color _green = Color(0xFF00b057);
  static Color _purple = Color(0xFFaf38b1);
  static Color _blue = Color(0xFF00aae0);

  final Offset circle1;
  final Offset circle2;
  final Offset circle3;
  final Offset circle4;
  final Offset circle5;

  _SpinnerPainter(
    this.circle1,
    this.circle2,
    this.circle3,
    this.circle4,
    this.circle5,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width * 0.08;
    canvas.drawCircle(_map(circle1, size), radius, Paint()..color = _blue);
    canvas.drawCircle(_map(circle2, size), radius, Paint()..color = _purple);
    canvas.drawCircle(_map(circle3, size), radius, Paint()..color = _green);
    canvas.drawCircle(_map(circle4, size), radius, Paint()..color = _yellow);
    canvas.drawCircle(_map(circle5, size), radius, Paint()..color = _red);
  }

  Offset _map(Offset offset, Size size) {
    return Offset(offset.dx * size.width, offset.dy * size.height);
  }

  @override
  bool shouldRepaint(_SpinnerPainter old) =>
      this.circle1 != old.circle1 ||
      this.circle2 != old.circle2 ||
      this.circle3 != old.circle3 ||
      this.circle4 != old.circle4 ||
      this.circle5 != old.circle5;
}
