import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'buttons/social_button.dart';
import 'core/vector_icons.dart';

const double widgetContainerWidth = 420;
const double widgetContainerHeight = 450;

class WidgetContainer extends StatelessWidget {
  final Widget child;
  final List<String> tags;
  final String gist;
  final double scale;

  WidgetContainer(
      {@required this.child,
      @required this.tags,
      @required this.gist,
      this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: widgetContainerWidth,
          height: widgetContainerHeight,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300, width: 1.5),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SocialCircularButton(
                      color: Colors.grey.shade100,
                      icon: VectorIcon(VectorIcons.github, color: Colors.grey.shade800),
                      tooltip: 'Github Gist',
                      onPressed: () {
                        _openGist(gist);
                      }),
                ],
              ),
              Center(child: Transform.scale(scale: scale, child: child)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 4,
                  runSpacing: -12,
                  children: tags.map((tag) => Chip(label: Text(tag))).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _openGist(String gist) async {
    print('$gist');
    final url = 'https://gist.github.com/tarek360/$gist';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
