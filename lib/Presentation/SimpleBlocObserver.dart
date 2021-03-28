import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    log(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    log("Cubit: " + cubit.toString());
    if (change.currentState is List) {
      log("Before: list size: ${(change.currentState as List).length}");
    } else {
      log("Before: " + change.currentState.toString());
    }
    if (change.nextState is List) {
      log("After: list size: ${(change.nextState as List).length}");
    } else {
      log("After: " + change.nextState.toString());
    }
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    log(error);
    super.onError(cubit, error, stackTrace);
  }
}
