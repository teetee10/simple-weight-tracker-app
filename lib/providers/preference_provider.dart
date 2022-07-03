import 'package:flutter/foundation.dart';
import 'package:tracker/api/user_api.dart';
import 'package:tracker/providers/provider.dart';
import 'package:tracker/transforms/init_store.dart';

class PreferenceProvider extends ChangeNotifier implements AppProvider {
  @override
  final AppStore? storage;
  @override
  final AuthApi? api;
  @override
  AppState? appState = AppState.idle;

  bool isFirstUse = false;
  bool isOnboarded = false;

  PreferenceProvider({this.api, this.storage}) {
    _loadFromStore();
  }

  void _loadFromStore() {
    isFirstUse = storage?.getBool('isFirstUse') ?? false;
    isOnboarded = storage?.getBool('isOnboarded') ?? false;
  }

  void setIsFirstUse() async {
    isFirstUse = true;
    await storage?.setBool('isFirstUse', isFirstUse);
  }

  void setIsOnboarded() async {
    isOnboarded = true;
    await storage?.setBool('isOnboarded', isOnboarded);
  }
}
