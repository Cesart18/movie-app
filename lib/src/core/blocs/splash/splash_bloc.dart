import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/core/ui.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<InitialConfigRequested>(_onInitialConfigRequested);
    add(const InitialConfigRequested());
  }
  Future<void> _onInitialConfigRequested(
    InitialConfigRequested event,
    Emitter<SplashState> emit,
  ) async {
    // Simulate some initial configuration work
    emit(state.copyWith(status: SplashStatus.loading));

    await Future<void>.delayed(const Duration(seconds: 2));

    emit(state.copyWith(status: SplashStatus.success));
  }
}
