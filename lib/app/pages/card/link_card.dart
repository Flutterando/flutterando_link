import 'dart:developer';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkCard extends StatelessWidget {
  final String title;
  final String? url;
  final String? icon;
  final String? backgroundColor;
  final String? textColor;

  const LinkCard({
    super.key,
    required this.title,
    this.url,
    this.icon,
    this.backgroundColor,
    this.textColor,
  });

  Color _colorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    return Color(int.parse("FF$hexColor", radix: 16));
  }

  void _launchUrl(String? url) {
    if (url != null && url.isNotEmpty) {
      log("Launching URL: $url");
      html.window.open(url, 'new_tab');
      // Use url_launcher here for actual URL opening.
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Card(
        color: backgroundColor != null
            ? _colorFromHex(backgroundColor!)
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null && icon!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: icon!.endsWith('.svg')
                      ? SvgPicture.asset(
                          icon!,
                          width: 40,
                          height: 40,
                        )
                      : Image.asset(
                          icon!,
                          width: 40,
                          height: 40,
                        ),
                ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor != null
                      ? _colorFromHex(textColor!)
                      : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
