import 'package:asp/asp.dart';
import 'package:flutterando_link/app/injector.dart';
import 'package:flutterando_link/app/interactor/extensions/result_extension.dart';
import 'package:flutterando_link/app/interactor/repositories/body_repository.dart';
import 'package:flutterando_link/app/interactor/states/body_state.dart';

final getBodyAction = atomAction((set) async {
  final response = injector.get<BodyRepository>();

  response
      .getBody() //
      .updateState(set, bodyState);
});
