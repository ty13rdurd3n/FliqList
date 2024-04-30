// ignore_for_file: prefer_const_constructors

import 'package:fliqlist/categories_expanded.dart';
import 'package:fliqlist/llogin_page.dart';
import 'package:fliqlist/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'search_screen.dart';
import 'constants.dart';
import 'components.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
//TODO:Sign-UP Screen And Database Connection for Watchlist
//TODO:Movie Card Expanded

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("email");
    user_email = email;
    runApp(MaterialApp(
        home: email == null ? LoginPage() : MyHomePage(title: "", index: 0)));
  } catch (e) {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    runApp(MaterialApp(home: LoginPage()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: "", index: 0),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.index});

  final String title;
  final int index;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

late int currentIndex;

class _MyHomePageState extends State<MyHomePage> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    currentIndex = widget.index;
    FirebaseDatabase.instance.setPersistenceEnabled(true);
    FirebaseDatabase.instance.ref().keepSynced(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: GNav(
          duration: Duration(milliseconds: 270),
          style: GnavStyle.google,
          selectedIndex: currentIndex,
          tabMargin: EdgeInsets.fromLTRB(20, 0, 19, 15),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          tabs: [
            GButton(
              gap: 10,
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              active: currentIndex == 0 ? true : false,
              shadow: currentIndex == 0
                  ? [
                      BoxShadow(
                          color: Color(0xFFE50914),
                          blurRadius: 6,
                          offset: Offset.zero)
                    ]
                  : null,
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              backgroundColor: Color(0xFFE50914),
              iconColor: Color(0xFFF5F5F1),
              iconActiveColor: Color(0xFFF5F5F1),
              iconSize: 37,
              icon: FontAwesomeIcons.film,
              text: "Movies",
              textStyle: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF5F5F1),
              ),
            ),
            GButton(
              gap: 10,
              onPressed: () {
                setState(
                  () {
                    currentIndex = 1;
                    Navigator.push(context,
                        createRoute(WatchlistPage(), Offset(10.0, 0.0)));
                  },
                );
              },
              active: currentIndex == 1 ? true : false,
              shadow: currentIndex == 1
                  ? [
                      BoxShadow(
                          color: Color(0xFFE50914),
                          blurRadius: 6,
                          offset: Offset.zero)
                    ]
                  : null,
              iconColor: Color(0xFFF5F5F1),
              iconActiveColor: Color(0xFFF5F5F1),
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              backgroundColor: Color(0xFFE50914),
              iconSize: 32,
              icon: FontAwesomeIcons.bookmark,
              text: "Watchlist",
              textStyle: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF5F5F1)),
            ),
            GButton(
              gap: 10,
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              active: currentIndex == 2 ? true : false,
              shadow: currentIndex == 2
                  ? [
                      BoxShadow(
                          color: Color(0xFFE50914),
                          blurRadius: 6,
                          offset: Offset.zero)
                    ]
                  : null,
              iconColor: Color(0xFFF5F5F1),
              iconActiveColor: Color(0xFFF5F5F1),
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              backgroundColor: Color(0xFFE50914),
              iconSize: 33,
              icon: FontAwesomeIcons.gear,
              text: "Settings",
              textStyle: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF5F5F1)),
            ),
          ]),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 40, 19, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 39),
              child: HomeAppBar(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 39),
              child: SearchField(
                icon: FontAwesomeIcons.magnifyingGlass,
                isreadOnly: true,
                boxShadow: BoxShadow(
                    color: Colors.black, offset: Offset(0, 1.5), blurRadius: 1),
                onbarTap: () {
                  setState(() {
                    Navigator.push(
                        context, createRoute(SearchPage(), Offset(0.0, 3.0)));
                  });
                },
                oniconTap: () {},
                onChange: (textData) {},
              ),
            ),
            TitleBar(
              mainText: "Categories",
              onTap: () {
                Navigator.push(
                    context, createRoute(CategoriesPage(), Offset(0.0, 3.0)));
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 22, bottom: 25),
              height: 46,
              child: Categories(),
            ),
            TitleBar(
              mainText: "Watchlist",
              onTap: () {
                Navigator.push(
                    context, createRoute(WatchlistPage(), Offset(0.0, 3.0)));
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 360,
              child: WatchlistGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

//component
Route createRoute(Widget childPage, Offset beginOffset) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimations) => childPage,
      transitionsBuilder: (context, animation, secondartAnimation, child) {
        final begin = beginOffset;
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: childPage);
      });
}
