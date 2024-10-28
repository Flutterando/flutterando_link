import 'package:flutter/material.dart';

import 'link_model.dart';

class BodyModel {
  final String? title;
  final String? subtitle;
  final String logo;
  final Color backgroundColor;
  final Color? textColor;
  final Color? buttonColor;
  final List<LinkModel> links;

  BodyModel({
    this.title,
    this.subtitle,
    required this.logo,
    required this.backgroundColor,
    this.textColor,
    this.buttonColor,
    this.links = const [],
  });
}

class EmptyBodyModel extends BodyModel {
  EmptyBodyModel()
      : super(
          logo: '',
          backgroundColor: Colors.white,
          links: [],
        );
}
