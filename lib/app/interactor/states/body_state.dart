import 'package:asp/asp.dart';

import '../exceptions/exceptions.dart';
import '../models/body_model.dart';

final bodyState = atom<BodyModel>(EmptyBodyModel());
final bodyStateLoadingState = atom<bool>(false);
final bodyExceptionState = atom<BodyException?>(null);
