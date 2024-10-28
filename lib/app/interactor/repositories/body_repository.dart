import 'package:flutterando_link/app/interactor/models/body_model.dart';
import 'package:result_dart/result_dart.dart';

import '../exceptions/exceptions.dart';

abstract class BodyRepository {
  AsyncResult<BodyModel, BodyException> getBody();
}
