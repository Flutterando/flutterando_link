import 'package:dson_adapter/dson_adapter.dart';
import '../../interactor/exceptions/exceptions.dart';
import '../../interactor/models/body_model.dart';
import '../../interactor/models/link_model.dart';
import '../../interactor/repositories/body_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../datasources/body_datasource.dart';

const dson = DSON();

class UnoBodyRepository implements BodyRepository {
  final BodyDatasource datasource;

  UnoBodyRepository(this.datasource);

  @override
  AsyncResult<BodyModel, BodyException> getBody() async {
    try {
      final json = await datasource.getJsonBody();
      final model = dson.fromJson(
        json,
        BodyModel.new,
        inner: {
          "links": ListParam<LinkModel>(LinkModel.new),
        },
        aliases: {
          BodyModel: {
            "background_color": "backgroundColor",
            "text_color": "textColor",
            "button_color": "buttonColor",
          },
          LinkModel: {
            "background_color": "backgroundColor",
            "text_color": "textColor",
          },
        },
      );

      return Result.success(model);
    } on BodyException catch (e) {
      return Result.failure(e);
    } on DSONException catch (e, s) {
      return Result.failure(BodyAdapterException(e.message, s));
    }
  }
}
