import 'package:result_dart/result_dart.dart';

import '../exceptions/exceptions.dart';
import '../models/body_model.dart';

abstract class BodyRepository {
  AsyncResult<BodyModel, BodyException> getBody();
}
