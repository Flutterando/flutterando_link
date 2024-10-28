import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando_link/app/data/datasources/body_datasource.dart';
import 'package:flutterando_link/app/data/repositories/uno_body_repository.dart';

class MockBodyDatasource implements BodyDatasource {
  @override
  Future<Map<String, dynamic>> getJsonBody() async {
    return {
      "logo": "https://flutterando.com.br/assets/img/logo.png",
    };
  }
}

void main() {
  test('Deve dar erro se nao tiver o bagulho requerido', () async {
    final repository = UnoBodyRepository(MockBodyDatasource());
    final result = await repository.getBody();
    print(result.exceptionOrNull());
    expect(result.isError(), true);
  });
}
