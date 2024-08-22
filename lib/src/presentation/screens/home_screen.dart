import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/src/presentation/screens/bookmark_screen.dart';
import 'package:movie_app/src/presentation/widgets/home_screen_banner.dart';
import 'package:movie_app/src/presentation/widgets/trending_movie.dart';

import '../widgets/top_rated_movies.dart';
import '../widgets/trending_tv_show.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _fadeController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Slide Animation
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    // Fade Animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    // Start animations
    _slideController.forward();
    _fadeController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black.withOpacity(0.95),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Container(
                height: 30,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.white60, shape: BoxShape.circle),
                child: const HugeIcon(
                  color: Colors.white,
                  icon: HugeIcons.strokeRoundedSearch02,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Container(
                  height: 40,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white60, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const HugeIcon(
                      color: Colors.white,
                      icon: HugeIcons.strokeRoundedBookmark01,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, BookMarkScreen.routeName);
                    },
                  ),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  const HomeScreenBanner(),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const TopRatedMovies(),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const TrendingMovies(),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const TrendingTvShow(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
