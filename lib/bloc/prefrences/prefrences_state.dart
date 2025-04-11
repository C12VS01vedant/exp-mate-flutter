part of 'prefreneces_bloc.dart';

@immutable
class PreferencesState extends Equatable {
  const PreferencesState({
    required this.isDarkMode,
    required this.isLoggedIn,
    required this.subscriptionStatus,
  });
  final bool isDarkMode;
  final bool isLoggedIn;
  final String subscriptionStatus;

  PreferencesState copyWith({
    bool? isDarkMode,
    bool? isLoggedIn,
    String? subscriptionStatus,
  }) {
    return PreferencesState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
    );
  }

  @override
  List<Object> get props => [isDarkMode, isLoggedIn, subscriptionStatus];
}
