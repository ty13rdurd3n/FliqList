import 'package:fliqlist/constants.dart';
import 'package:fliqlist/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});
  

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
} 

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 25),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            createRoute(const MyHomePage(title: "", index: 0),
                                const Offset(-10.0, 0.0)));
                      });
                    },
                    child: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: 25,
                      color: Color(0xFFF5F5F1),
                    ),
                  ),
                ),
                Text(
                  "Watchlist",
                  style: GoogleFonts.openSans(
                    color: const Color(0xFFF5F5F1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
