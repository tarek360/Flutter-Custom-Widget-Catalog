import 'package:flutter/material.dart';

import 'buttons/social_button.dart';
import 'custom_widget_container.dart';
import 'otp_widget.dart';
import 'spinner/spinner.dart';
import 'user_profile/profile_header.dart';

class CustomWidgetsData {
  static final List<CustomWidgetData> data = [
    CustomWidgetData(
        customWidget: Spinner(size: 200),
        tags: ['spinner', 'loader', 'dots', 'animation'],
        gist: 'dd64cc40af2acf3bbd9bc9b464289849',
        scale: 0.92),
    CustomWidgetData(
        customWidget: OtpWidget(Colors.pink),
        tags: ['otp', 'pin code', 'keypad'],
        gist: '151361e3315a9ab8e4b4781302773b05',
        scale: 0.92),
    CustomWidgetData(
        customWidget: SocialRoundedButtonsWithText(),
        tags: ['social', 'github', 'facebook', 'twitter', 'google'],
        gist: '4ff471f4b125b24469d1386650163ace'),
    CustomWidgetData(
        customWidget: SocialCircularButtons(),
        tags: ['social', 'github', 'facebook', 'twitter', 'google'],
        gist: '7e375bcadee0b583047b764084684986'),
    CustomWidgetData(
        customWidget: ProfileHeader(),
        tags: [
          'user',
          'profile',
          'avatar',
          'circle',
          'circular',
          'curved',
          'header',
        ],
        gist: '26b04ab236776b62168e5f2eb3af57d6',
        scale: 0.92),
  ];
}

class CustomWidgetData {
  CustomWidgetData(
      {Widget customWidget, this.tags, this.gist, double scale: 1.0})
      : this.widget = WidgetContainer(
          child: customWidget,
          tags: tags,
          gist: gist,
          scale: scale,
        );

  final Widget widget;
  final List<String> tags;
  final String gist;
}
