import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seven_paradises/constants/measures.dart';

class NewGridView extends StatelessWidget {
  final List<dynamic> data;
  final Function action;
  final Function widget;
  final int minSize;
  NewGridView(
      {@required this.data,
      this.action,
      @required this.widget,
      @required this.minSize});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double widgetSize = 100.0;
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
          widgetSize = screenWidth / 2 - 20 * 2;
        else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet)
          widgetSize = screenWidth / 3 - 20 * 3;
        else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.desktop) {
          final double sizeAvailable =
              screenWidth - kDefaultWebPaddingHorizontal * 2;
          final int quantity = ((sizeAvailable - minSize) ~/ (minSize + 20));
          final double timesQuantity =
              (sizeAvailable - quantity * 20) / minSize / (quantity + 1);
          widgetSize = timesQuantity * minSize - 0.01;
        }
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          direction: Axis.horizontal,
          spacing: 20.0,
          runSpacing: 20.0,
          children: List.generate(
            data.length,
            (index) {
              return widget(
                data[index],
                action,
                widgetSize,
              );
            },
          ),
        );
      },
    );
  }
}
