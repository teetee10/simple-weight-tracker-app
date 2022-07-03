enum AppState { isFetching, idle, onboarding }

abstract class AppProvider {
  final storage;
  final api;
  AppState? appState = AppState.idle;
  AppProvider({this.storage, this.api});

}
