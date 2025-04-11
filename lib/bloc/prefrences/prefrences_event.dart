part of 'prefreneces_bloc.dart';

abstract class PreferencesEvent {}

class LoadPreferences extends PreferencesEvent {}

class ToggleTheme extends PreferencesEvent {
  ToggleTheme(this.isDark);
  final bool isDark;
}

class UpdateLoginState extends PreferencesEvent {
  UpdateLoginState(this.isLoggedIn);
  final bool isLoggedIn;
}

class UpdateSubscriptionStatus extends PreferencesEvent {
  UpdateSubscriptionStatus(this.isSubscribed);
  final String isSubscribed;
}
