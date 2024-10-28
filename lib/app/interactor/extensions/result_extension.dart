import 'package:asp/asp.dart';
import 'package:flutterando_link/app/interactor/exceptions/exceptions.dart';
import 'package:flutterando_link/app/interactor/states/body_state.dart';
import 'package:result_dart/result_dart.dart';

extension ResultExtension<S extends Object, F extends BodyException> on Result<S, F> {
  Result<S, F> updateState(SetState set, Atom<S> atom) {
    fold(
      (value) => set(atom, value),
      (error) => set(bodyExceptionState, error),
    );

    return this;
  }
}

extension AsyncResultExtension<S extends Object, F extends BodyException> on AsyncResult<S, F> {
  AsyncResult<S, F> updateState(SetState set, Atom<S> atom) {
    return then((result) => result.updateState(set, atom));
  }
}
