import 'package:flutter/material.dart';

import 'custom_widget_container.dart';
import 'otp_widget.dart';

class CustomWidgetsData {
  static final List<CustomWidgetData> data = [
    CustomWidgetData(customWidget: OtpWidget(Colors.pink), tags: ['otp', 'pin code', 'keypad']),
  ];
}

class CustomWidgetData {
  CustomWidgetData({Widget customWidget, this.tags})
      : this.widget = WidgetContainer(child: customWidget, tags: tags, scale: 0.92,);

  final Widget widget;

  final List<String> tags;
}
