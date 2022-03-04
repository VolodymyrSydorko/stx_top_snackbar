// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';

enum IconPositionType { left, right }

/// Popup widget that you can use by default to show some information
class StxSnackBar extends StatefulWidget {
  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double textScaleFactor;
  final EdgeInsetsGeometry iconPadding;
  final IconPositionType iconPositionType;
  final double height;

  const StxSnackBar.success({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 0,
    this.backgroundColor = const Color(0xff00E676),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.iconPadding = const EdgeInsets.all(10),
    this.iconPositionType = IconPositionType.left,
    this.height = 80,
  });

  const StxSnackBar.info({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 0,
    this.backgroundColor = const Color(0xff2196F3),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.iconPadding = const EdgeInsets.all(10),
    this.iconPositionType = IconPositionType.left,
    this.height = 80,
  });

  const StxSnackBar.error({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.error_outline,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 0,
    this.backgroundColor = const Color(0xffff5252),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.iconPadding = const EdgeInsets.all(10),
    this.iconPositionType = IconPositionType.left,
    this.height = 80,
  });

  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<StxSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = Padding(
      padding: widget.iconPadding,
      child: Transform.rotate(
        angle: widget.iconRotationAngle * pi / 180,
        child: widget.icon,
      ),
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      width: double.infinity,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            widget.iconPositionType == IconPositionType.left
                ? icon
                : const Spacer(),
            Flexible(
              flex: 10,
              child: Text(
                widget.message,
                style: theme.textTheme.bodyText2?.merge(
                  widget.textStyle,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                textScaleFactor: widget.textScaleFactor,
              ),
            ),
            widget.iconPositionType == IconPositionType.right
                ? icon
                : const Spacer(),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0.0, 8.0),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));
