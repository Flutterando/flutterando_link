import 'package:auto_injector/auto_injector.dart';
import 'package:flutterando_link/app/data/datasources/remote_body_datasource.dart';
import 'package:uno/uno.dart';

import 'data/datasources/local_body_datasource.dart';
import 'data/repositories/uno_body_repository.dart';
import 'interactor/repositories/body_repository.dart';

final injector = AutoInjector();

void setupInjection() {
  injector.addInstance(Uno());
  injector.add<BodyRepository>(UnoBodyRepository.new);

  if (_isProduction()) {
    injector.add(RemoteBodyDatasource.new);
  } else {
    injector.add(LocalBodyDatasource.new);
  }
}

bool _isProduction() {
  var isProduction = true;

  assert(() {
    isProduction = false;
    return true;
  }());

  return isProduction;
}
