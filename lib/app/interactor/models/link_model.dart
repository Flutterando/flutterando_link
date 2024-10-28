import 'package:flutter/material.dart';

class LinkModel {
  final String title;
  final String url;
  final String? icon;
  final Color backgroundColor;
  final Color textColor;

  LinkModel({
    required this.title,
    required this.url,
    this.icon,
    required this.backgroundColor,
    required this.textColor,
  });
}
