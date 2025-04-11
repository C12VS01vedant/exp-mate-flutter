import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_offline_repository/expense_offline_repository.dart';
import 'package:meta/meta.dart';

part 'prefrences_event.dart';
part 'prefrences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc(this.repository)
      : super(
          PreferencesState(
            isDarkMode: repository.isDarkMode,
            isLoggedIn: repository.isLoggedIn,
            subscriptionStatus: repository.isSubscribed,
          ),
        ) {
    on<LoadPreferences>((event, emit) {
      emit(
        PreferencesState(
          isDarkMode: repository.isDarkMode,
          isLoggedIn: repository.isLoggedIn,
          subscriptionStatus: repository.isSubscribed,
        ),
      );
    });

    on<ToggleTheme>((event, emit) async {
      await repository.setThemeMode(event.isDark);
      emit(state.copyWith(isDarkMode: event.isDark));
    });

    on<UpdateLoginState>((event, emit) async {
      await repository.setLoginStatus(event.isLoggedIn);
      emit(state.copyWith(isLoggedIn: event.isLoggedIn));
    });

    on<UpdateSubscriptionStatus>((event, emit) async {
      await repository.setSubscriptionStatus(event.isSubscribed);
      emit(state.copyWith(subscriptionStatus: event.isSubscribed));
    });
  }
  final ExpenseOfflineRepository repository;
}
