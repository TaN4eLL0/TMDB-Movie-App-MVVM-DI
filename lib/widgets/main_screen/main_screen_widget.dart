import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:movieapp/navigation/main_navigation.dart';
import 'package:movieapp/widgets/main_screen/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MainScreenWidget extends StatefulWidget {
  final ScreenFactory screenFactory;

  const MainScreenWidget({
    Key? key,
    required this.screenFactory,
  }) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(
      () {
        _selectedTab = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MovieApp',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () => model.logoutAccount(context),
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: LazyLoadIndexedStack(
        index: _selectedTab,
        children: [
          widget.screenFactory.makeMovieHome(),
          widget.screenFactory.makeMovieList(),
          widget.screenFactory.makeMovieFavorite(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_rounded),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        onTap: onSelectedTab
      ),
    );
  }
}
