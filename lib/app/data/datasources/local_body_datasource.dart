import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutterando_link/app/data/datasources/body_datasource.dart';

class LocalBodyDatasource implements BodyDatasource {
  @override
  Future<Map<String, dynamic>> getJsonBody() async {
    final json = await rootBundle.loadString('assets/body.json');
    return jsonDecode(json);
  }
}
