import 'package:flutter/material.dart';

import 'buttons/social_button.dart';
import 'custom_widget_container.dart';
import 'otp_widget.dart';
import 'user_profile/profile_header.dart';

class CustomWidgetsData {
  static final List<CustomWidgetData> data = [
    CustomWidgetData(
        customWidget: OtpWidget(Colors.pink),
        tags: ['otp', 'pin code', 'keypad'],
        scale: 0.92),
    CustomWidgetData(
        customWidget: SocialRoundedButtonsWithText(),
        tags: ['social', 'github', 'facebook', 'twitter', 'google']),
    CustomWidgetData(
        customWidget: SocialCircularButtons(),
        tags: ['social', 'github', 'facebook', 'twitter', 'google']),
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
        scale: 0.92),
  ];
}

class CustomWidgetData {
  CustomWidgetData({Widget customWidget, this.tags, double scale: 1.0})
      : this.widget = WidgetContainer(
          child: customWidget,
          tags: tags,
          scale: scale,
        );

  final Widget widget;

  final List<String> tags;
}
