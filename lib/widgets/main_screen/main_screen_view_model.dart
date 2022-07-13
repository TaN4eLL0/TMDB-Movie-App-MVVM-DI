import 'package:flutter/cupertino.dart';
import 'package:movieapp/domain/data_providers/session_data_provider.dart';
import 'package:movieapp/navigation/main_navigation_actions.dart';

class MainScreenViewModel extends ChangeNotifier {
  final SessionDataProvider sessionDataProvider;

  MainScreenViewModel(this.sessionDataProvider);


  void logoutAccount(BuildContext context) {
    sessionDataProvider.deleteSessionId();
    const MainNavigationActions().resetNavigation(context);
  }
}