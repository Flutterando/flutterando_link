import 'package:asp/asp.dart';

import '../../injector.dart';
import '../extensions/result_extension.dart';
import '../repositories/body_repository.dart';
import '../states/body_state.dart';

final getBodyAction = atomAction((set) async {
  final response = injector.get<BodyRepository>();

  response
      .getBody() //
      .updateState(set, bodyState);
});
