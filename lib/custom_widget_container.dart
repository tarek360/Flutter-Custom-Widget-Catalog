import 'package:flutter/material.dart';

const double widgetContainerWidth = 420;
const double widgetContainerHeight = 450;

class WidgetContainer extends StatelessWidget {
  final Widget child;
  final List<String> tags;
  final double scale;

  WidgetContainer(
      {@required this.child, @required this.tags, this.scale = 1.0});

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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.content_copy),
                    onPressed: () {},
                    tooltip: "Copy code",
                  ),
                  IconButton(
                    icon: Icon(Icons.link),
                    onPressed: () {},
                    tooltip: "Github",
                  ),
                ],
              ),
              Transform.scale(scale: scale, child: child),
              SizedBox(height: 4),
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
}
