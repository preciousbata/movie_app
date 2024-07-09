import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/screens/bookmark_screen.dart';
import 'package:movie_app/src/presentation/screens/home_screen.dart';

class BottomNav extends StatefulWidget {
  static const routeName = '/';
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  final selectedIndex = 0;
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final _tabs = <Tab>[
    const Tab(
      icon: Icon(Icons.home_rounded),
    ),
    const Tab(
      icon: Icon(Icons.bookmark),
    ),
    const Tab(
      icon: Icon(Icons.download),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.1),
      body: TabBarView(
        controller: _tabController, 
        children: [
        const HomeScreen(),
        const BookMarkScreen(),
        Container(
          color: Colors.amber,
        ),
      ]),
      bottomNavigationBar: TabBar(
        tabs: _tabs,
        unselectedLabelColor: Colors.grey.shade400,
        controller: _tabController,
      ),
    );
  }
}
