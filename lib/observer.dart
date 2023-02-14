import 'export.dart';

class MyObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("$bloc => $transition");
  }
}
