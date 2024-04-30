import 'package:fliqlist/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> catergories = [
      "Action",
      "Comedy",
      "Crime",
      "Romance",
      "Thriller",
      "Horror",
      "Action",
      "Comedy",
      "Crime",
      "Romance",
      "Thriller",
      "Horror",
      "Comedy",
      "Crime",
      "Romance",
      "Thriller",
      "Horror",
    ];
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
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: 25,
                      color: Color(0xFFF5F5F1),
                    ),
                  ),
                ),
                Text(
                  "Categories",
                  style: GoogleFonts.openSans(
                    color: const Color(0xFFF5F5F1),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 300,
              width: 415,
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 55,
                ),
                itemCount: catergories.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xFF323232),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 1.5),
                                blurRadius: 1),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            catergories[index],
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFF5F5F1)),
                          ),
                        ),
                      ),
                      // Flexible(
                      //   fit: FlexFit.tight,
                      //   flex: 1,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 15, right: 15),
                      //     child: Text(
                      //       _moviesWatchlist[index],
                      //       textAlign: TextAlign.center,
                      //       style: GoogleFonts.openSans(
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.bold,
                      //           color: const Color(0xFFF5F5F1)),
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
