import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';
import 'card/link_card.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({super.key});

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  Map<String, dynamic>? data;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadJsonData();
    });
  }

  Future<void> _loadJsonData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/body.json');
      setState(() {
        data = json.decode(jsonString);
      });
    } catch (e, s) {
      logger.e("Error loading JSON data", error: e, stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return Scaffold(
      backgroundColor: _colorFromHex(data!['background_color'] ?? '#FFFFFF'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (data!['logo'] != null && data!['logo'].isNotEmpty)
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(data!['logo']),
                radius: 50,
              ),
            ),
          const SizedBox(height: 16),
          if (data!['title'] != null && data!['title'].isNotEmpty)
            Center(
              child: Text(
                data!['title'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _colorFromHex(data!['text_color'] ?? '#000000'),
                ),
              ),
            ),
          if (data!['subtitle'] != null && data!['subtitle'].isNotEmpty)
            Center(
              child: Text(
                data!['subtitle'],
                style: TextStyle(
                  fontSize: 16,
                  color: _colorFromHex(data!['text_color'] ?? '#000000'),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: 24),
          ...data!['links'].map<Widget>(
            (link) {
              return LinkCard(
                title: link['title'],
                url: link['url'],
                icon: link['icon'],
                backgroundColor: link['background_color'],
                textColor: link['text_color'],
              );
            },
          ).toList(),
        ],
      ),
    );
  }

  Color _colorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    return Color(int.parse("FF$hexColor", radix: 16));
  }
}
