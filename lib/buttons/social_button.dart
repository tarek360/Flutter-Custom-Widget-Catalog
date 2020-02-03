import 'package:flutter/material.dart';

import '../core/vector_icons.dart';

class SocialColors {
  SocialColors._();

  static const github = const Color(0xFF272727);
  static const google = const Color(0xFFEA4335);
  static const facebook = const Color(0xFF3B5998);
  static const twitter = const Color(0xFF1DA1F2);
}

class SocialCircularButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final VoidCallback onPressed;
  final String tooltip;

  SocialCircularButton(
      {@required this.icon,
      this.color,
      @required this.onPressed,
      this.tooltip});

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    final Color buttonColor = color ?? buttonTheme.colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: ShapeDecoration(
          color: buttonColor,
          shape: CircleBorder(),
        ),
        child: IconButton(icon: icon, tooltip: tooltip, onPressed: () {}),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final VoidCallback onPressed;
  final String text;

  SocialButton(
      {@required this.icon,
      this.color,
      @required this.onPressed,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    final Color buttonColor = color ?? buttonTheme.colorScheme.primary;

    return SizedBox(
      width: 200,
      child: MaterialButton(
        child: Row(
          children: [
            icon,
            SizedBox(width: 8),
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white))
          ],
        ),
        onPressed: () {},
        color: buttonColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}

class SocialCircularButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SocialCircularButton(
          color: SocialColors.facebook,
          icon: VectorIcon(VectorIcons.facebook, color: Colors.white),
          tooltip: 'Facebook Sign In',
          onPressed: () {}),
      SocialCircularButton(
          color: SocialColors.twitter,
          icon: VectorIcon(VectorIcons.twitter, color: Colors.white),
          tooltip: 'Twitter Sign In',
          onPressed: () {}),
      SocialCircularButton(
          color: SocialColors.github,
          icon: VectorIcon(VectorIcons.github, color: Colors.white),
          tooltip: 'Github Sign In',
          onPressed: () {}),
      SocialCircularButton(
          color: SocialColors.google,
          icon: VectorIcon(VectorIcons.google, color: Colors.white),
          tooltip: 'Google Sign In',
          onPressed: () {}),
    ]);
  }
}

class SocialRoundedButtonsWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SocialButton(
          color: SocialColors.facebook,
          icon: VectorIcon(VectorIcons.facebook, color: Colors.white),
          text: 'Facebook Sign In',
          onPressed: () {}),
      SocialButton(
          color: SocialColors.twitter,
          icon: VectorIcon(VectorIcons.twitter, color: Colors.white),
          text: 'Twitter Sign In',
          onPressed: () {}),
      SocialButton(
          color: SocialColors.github,
          icon: VectorIcon(VectorIcons.github, color: Colors.white),
          text: 'Github Sign In',
          onPressed: () {}),
      SocialButton(
          color: SocialColors.google,
          icon: VectorIcon(VectorIcons.google, color: Colors.white),
          text: 'Google Sign In',
          onPressed: () {}),
    ]);
  }
}

class VectorIcons {
  VectorIcons._();

  static VectorIconData get facebook => FacebookVectorIcon();

  static VectorIconData get twitter => TwitterVectorIcon();

  static VectorIconData get github => GithubVectorIcon();

  static VectorIconData get google => GoogleVectorIcon();
}

class FacebookVectorIcon extends VectorIconData {
  @override
  Path get path => Path()
    ..moveTo(73.233, 32.380)
    ..lineTo(57.408, 32.380)
    ..lineTo(57.408, 22.002)
    ..cubicTo(57.408, 18.104, 59.992, 17.195, 61.811, 17.195)
    ..lineTo(72.979, 17.195)
    ..lineTo(72.979, 0.060)
    ..lineTo(57.599, -0.000)
    ..cubicTo(40.526, -0.000, 36.640, 12.780, 36.640, 20.958)
    ..lineTo(36.640, 32.380)
    ..lineTo(26.767, 32.380)
    ..lineTo(26.767, 50.037)
    ..lineTo(36.640, 50.037)
    ..lineTo(36.640, 100.000)
    ..lineTo(57.408, 100.000)
    ..lineTo(57.408, 50.037)
    ..lineTo(71.422, 50.037)
    ..lineTo(73.233, 32.380)
    ..close();

  @override
  Size get size => Size(100.0, 100.0);
}

class TwitterVectorIcon extends VectorIconData {
  @override
  Path get path => Path()
    ..moveTo(100.000, 18.987)
    ..cubicTo(96.324, 20.621, 92.367, 21.723, 88.216, 22.216)
    ..cubicTo(92.455, 19.679, 95.705, 15.660, 97.237, 10.865)
    ..cubicTo(93.273, 13.218, 88.884, 14.925, 84.209, 15.847)
    ..cubicTo(80.468, 11.860, 75.135, 9.367, 69.235, 9.367)
    ..cubicTo(57.906, 9.367, 48.720, 18.552, 48.720, 29.883)
    ..cubicTo(48.720, 31.489, 48.901, 33.054, 49.252, 34.558)
    ..cubicTo(32.201, 33.702, 17.082, 25.535, 6.963, 13.122)
    ..cubicTo(5.197, 16.151, 4.186, 19.675, 4.186, 23.438)
    ..cubicTo(4.186, 30.555, 7.807, 36.836, 13.312, 40.514)
    ..cubicTo(9.951, 40.407, 6.786, 39.483, 4.019, 37.946)
    ..cubicTo(4.017, 38.032, 4.017, 38.119, 4.017, 38.206)
    ..cubicTo(4.017, 48.145, 11.089, 56.435, 20.476, 58.323)
    ..cubicTo(18.754, 58.790, 16.942, 59.041, 15.070, 59.041)
    ..cubicTo(13.747, 59.041, 12.462, 58.913, 11.209, 58.672)
    ..cubicTo(13.822, 66.822, 21.397, 72.755, 30.374, 72.920)
    ..cubicTo(23.352, 78.423, 14.508, 81.703, 4.894, 81.703)
    ..cubicTo(3.240, 81.703, 1.606, 81.606, -0.000, 81.415)
    ..cubicTo(9.082, 87.239, 19.865, 90.633, 31.450, 90.633)
    ..cubicTo(69.188, 90.633, 89.822, 59.372, 89.822, 32.261)
    ..cubicTo(89.822, 31.371, 89.804, 30.484, 89.765, 29.603)
    ..cubicTo(93.772, 26.717, 97.251, 23.102, 100.000, 18.987)
    ..close();

  @override
  Size get size => Size(100.0, 100.0);
}

class GoogleVectorIcon extends VectorIconData {
  @override
  Path get path => Path()
    ..moveTo(50.988, 42.844)
    ..cubicTo(50.964, 48.525, 50.988, 54.207, 51.012, 59.888)
    ..cubicTo(60.537, 60.199, 70.085, 60.055, 79.610, 60.199)
    ..cubicTo(75.409, 81.325, 46.667, 88.176, 31.461, 74.379)
    ..cubicTo(15.824, 62.276, 16.564, 35.730, 32.821, 24.487)
    ..cubicTo(44.184, 15.415, 60.346, 17.659, 71.708, 25.513)
    ..cubicTo(76.173, 21.383, 80.350, 16.967, 84.384, 12.384)
    ..cubicTo(74.931, 4.840, 63.329, -0.531, 50.988, 0.042)
    ..cubicTo(25.230, -0.818, 1.549, 21.741, 1.120, 47.499)
    ..cubicTo(-0.528, 68.554, 13.318, 89.203, 32.869, 96.651)
    ..cubicTo(52.348, 104.147, 77.318, 99.038, 89.756, 81.540)
    ..cubicTo(97.968, 70.487, 99.734, 56.260, 98.779, 42.892)
    ..cubicTo(82.833, 42.772, 66.910, 42.796, 50.988, 42.844)
    ..close();

  @override
  Size get size => Size(100.0, 100.0);
}

class GithubVectorIcon extends VectorIconData {
  @override
  Path get path => Path()
    ..moveTo(67.278, 57.117)
    ..cubicTo(63.376, 57.117, 60.211, 61.493, 60.211, 66.896)
    ..cubicTo(60.211, 72.299, 63.376, 76.677, 67.278, 76.677)
    ..cubicTo(71.178, 76.677, 74.341, 72.299, 74.341, 66.896)
    ..cubicTo(74.342, 61.493, 71.178, 57.117, 67.278, 57.117)
    ..close()
    ..moveTo(91.877, 31.665)
    ..cubicTo(92.682, 29.680, 92.722, 18.403, 88.432, 7.609)
    ..cubicTo(88.432, 7.609, 78.587, 8.688, 63.692, 18.909)
    ..cubicTo(60.571, 18.047, 55.284, 17.615, 50.000, 17.615)
    ..cubicTo(44.716, 17.615, 39.432, 18.046, 36.307, 18.908)
    ..cubicTo(21.412, 8.688, 11.571, 7.609, 11.571, 7.609)
    ..cubicTo(7.279, 18.403, 7.317, 29.680, 8.123, 31.665)
    ..cubicTo(3.080, 37.140, 0.000, 43.715, 0.000, 52.699)
    ..cubicTo(0.000, 91.755, 32.401, 92.382, 40.580, 92.382)
    ..cubicTo(42.432, 92.382, 46.111, 92.386, 50.000, 92.391)
    ..cubicTo(53.889, 92.386, 57.571, 92.382, 59.420, 92.382)
    ..cubicTo(67.599, 92.382, 100.000, 91.755, 100.000, 52.699)
    ..cubicTo(100.000, 43.715, 96.920, 37.140, 91.877, 31.665)
    ..close()
    ..moveTo(50.153, 87.580)
    ..lineTo(49.848, 87.580)
    ..cubicTo(29.349, 87.580, 13.386, 85.133, 13.386, 65.211)
    ..cubicTo(13.386, 60.440, 15.070, 56.010, 19.070, 52.334)
    ..cubicTo(25.745, 46.208, 37.034, 49.452, 49.848, 49.452)
    ..lineTo(50.154, 49.452)
    ..cubicTo(62.968, 49.452, 74.261, 46.209, 80.933, 52.334)
    ..cubicTo(84.933, 56.010, 86.616, 60.440, 86.616, 65.211)
    ..cubicTo(86.615, 85.133, 70.652, 87.580, 50.153, 87.580)
    ..close()
    ..moveTo(32.722, 57.117)
    ..cubicTo(28.822, 57.117, 25.659, 61.493, 25.659, 66.896)
    ..cubicTo(25.659, 72.299, 28.822, 76.677, 32.722, 76.677)
    ..cubicTo(36.626, 76.677, 39.789, 72.299, 39.789, 66.896)
    ..cubicTo(39.788, 61.493, 36.625, 57.117, 32.722, 57.117)
    ..close();

  @override
  Size get size => Size(100.0, 100.0);
}
