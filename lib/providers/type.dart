enum AppState { isFetching, idle, onboarding }

abstract class AppProvider {
  final dynamic storage;
  final dynamic api;
  AppState? appState = AppState.idle;
  AppProvider({this.storage, this.api});
}
