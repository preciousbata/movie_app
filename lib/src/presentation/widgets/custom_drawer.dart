import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection.dart';
import 'package:movie_app/src/presentation/bloc/cubit/bookmark_cubit.dart';
import 'package:movie_app/src/presentation/screens/bookmark_screen.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });

  final _cubit = sl.get<BookmarkCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarkCubit, BookmarkState>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/images/bg_image.jpg'),
                      fit: BoxFit.cover),
                ),
                child:
                    SizedBox.shrink(), //BoxDecoration //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                  leading: const Icon(Icons.bookmark),
                  title: const Text('Bookmarks '),
                  onTap: () =>
                      Navigator.pushNamed(context, BookMarkScreen.routeName)),

              ListTile(
                leading: const Icon(Icons.close),
                title: const Text(
                  'Close',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
