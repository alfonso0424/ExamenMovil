import 'package:flutter/material.dart';

class Activity{
  final String title;
  final String subtitle;
  final String trailingText;
  final IconData icon;
  final Color iconColor;
  final WidgetBuilder destination;

  const Activity({
    required this.title,
    required this.subtitle,
    required this.trailingText,
    required this.icon,
    required this.iconColor,
    required this.destination,
  });
}