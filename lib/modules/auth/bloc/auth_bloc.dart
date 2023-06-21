import 'package:bloc/bloc.dart';
import 'package:map_demo/modules/auth/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepository();

  AuthBloc() : super(SignUpState()) {
    on<SignUpEvent>((event, emit) async {
      try {
        emit(SignUpState(isLoading: true));
        await authRepository.singUp(event.name, event.email, event.password);
        emit(SignUpState(isLoading: false, isLoaded: true));
      } catch (e) {
        emit(SignUpState(hasError: true));
      }
    });
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginState(isLoading: true));
        await authRepository.login(event.email, event.password);
        emit(LoginState(isLoading: false, isLoaded: true));
      } catch (e) {
        emit(LoginState(hasError: true));
      }
    });
  }
}
