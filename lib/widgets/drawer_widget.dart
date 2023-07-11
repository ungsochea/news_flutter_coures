import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/inner_screens/bookmark_screen.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Image.asset(
                    'assets/images/newspaper.png',
                    width: 60,
                    height: 60,
                  )),
                  const VerticalSpacing(20),
                  Flexible(
                      child: Text(
                    'News App',
                    style: GoogleFonts.lobster(
                        textStyle:
                            const TextStyle(fontSize: 20, letterSpacing: 0.6)),
                  )),
                ],
              )),
          const VerticalSpacing(20),
          ListTileWidget(
            label: "Home",
            icon: IconlyBold.home,
            fct: () {},
          ),
          ListTileWidget(
            label: "Bookmark",
            icon: IconlyBold.bookmark,
            fct: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const BookmarkScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
            },
          ),
          const Divider(
            thickness: 5,
          ),
          SwitchListTile(
              title: Text(
                themeProvider.getDarkTheme ? 'Dark' : 'Light',
                style: TextStyle(fontSize: 20),
              ),
              secondary: Icon(
                themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              value: themeProvider.getDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              }),
        ]),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {Key? key, required this.label, required this.fct, required this.icon})
      : super(key: key);
  final String label;
  final Function fct;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        fct();
      },
    );
  }
}
