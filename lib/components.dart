// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fliqlist/categories_expanded.dart';
import 'package:fliqlist/constants.dart';
import 'package:fliqlist/firestore_service.dart';
import 'package:fliqlist/movie_view.dart';
import 'package:fliqlist/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fliqlist/main.dart';

//Watchlist Grid

List<String> moviesWatchlist = [
  "Fight Club",
  "American Psycho",
  "Shawshank Redemption",
  "The Matrix",
  "James Bond : Casino Royale",
  "John Wick : Chapter 4"
];

class WatchlistGrid extends StatefulWidget {
  const WatchlistGrid({
    super.key,
  });
  @override
  State<WatchlistGrid> createState() => _WatchlistGridState();
}

class _WatchlistGridState extends State<WatchlistGrid> {
  @override
  Widget build(BuildContext context) {
    if (moviesWatchlist.isEmpty) {
      return Center(
          child: Text(
        "OOPS!, looks like your watchlist is empty.",
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFF5F5F1)),
      ));
    } else {
      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user_email)
            .collection("watchlist")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 28, mainAxisExtent: 290),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot movie = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () async {
                    // var _firedriver = new FirestoreDriver();
                    // await _firedriver.uploadData(
                    //     email: "candyman@candysto.re",
                    //     title: "Fight Club",
                    //     imdbRating: "8.8",
                    //     posterUrl: "nourl",
                    //     runTime: "139",
                    //     year: "1999",
                    //     plotDescription: "marla meets tyler",
                    //     imdbID: "ttwb00b13stoo");
                    // Navigator.push(
                    //     context,
                    //     createRoute(
                    //         MovieCard(movie: Movie("", "", "", "", "", "", "")),
                    //         const Offset(-10.0, 0.0)));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 4,
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 1.5),
                                    blurRadius: 3),
                              ],
                              borderRadius: BorderRadius.circular(27),
                              color: const Color(0xFFB81D24),
                            )),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            movie["title"],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFF5F5F1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('PLease Wait');
          }
        },
      );
    }
  }
}

//Categories Slider

class Categories extends StatefulWidget {
  const Categories({
    super.key,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> catergories = [
    "Action",
    "Comedy",
    "Crime",
    "Romance",
    "Thriller",
    "Horror"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 2),
      controller: ScrollController(),
      scrollDirection: Axis.horizontal,
      itemCount: catergories.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return Container(
          margin: const EdgeInsets.only(right: 15),
          width: 102,
          decoration: BoxDecoration(
            color: const Color(0xFF323232),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 1.5), blurRadius: 1),
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
        );
      },
    );
  }
}

//Title Bar

class TitleBar extends StatelessWidget {
  final String mainText;
  final Function onTap;
  const TitleBar({super.key, required this.mainText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          mainText,
          style: GoogleFonts.openSans(
              color: const Color(0xFFF5F5F1),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () => {onTap()},
          child: Text(
            "Show All",
            style: GoogleFonts.openSans(
                color: const Color(0xFFB81D24),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

//App Bar-Home Screen

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Dulina !",
              style: GoogleFonts.openSans(
                  color: const Color(0xFFF5F5F1), fontSize: 14),
            ),
            Text(
              "Let's Find All The Movies You Like !",
              style: GoogleFonts.openSans(
                  color: const Color(0xFFF5F5F1),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xFFE50914),
          ),
        ),
      ],
    );
  }
}

//Search Field

class SearchField extends StatefulWidget {
  final Function onbarTap;
  final Function oniconTap;
  final IconData icon;
  final bool isreadOnly;
  final BoxShadow boxShadow;
  final void Function(String?) onChange;
  const SearchField({
    super.key,
    required this.onbarTap,
    required this.onChange,
    required this.icon,
    required this.oniconTap,
    required this.isreadOnly,
    required this.boxShadow,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(31),
        color: const Color(0xFF323232),
        boxShadow: [widget.boxShadow],
      ),
      child: TextField(
          readOnly: widget.isreadOnly,
          onTap: () => widget.onbarTap(),
          onChanged: (text) {
            setState(() {
              widget.onChange(text);
            });
          },
          cursorColor: const Color(0xFF757575),
          enabled: true,
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: const Color(0xFF757575)),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 25),
              hintText: "Search Movie ...",
              hintStyle: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: const Color(0xFF757575)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(31),
                  borderSide: BorderSide.none),
              prefixIcon: Container(
                margin: const EdgeInsets.fromLTRB(20, 19, 25, 18),
                height: 27,
                width: 26.67,
                child: GestureDetector(
                  onTap: () {
                    widget.oniconTap();
                  },
                  child: Icon(
                    widget.icon,
                    color: const Color(0xFF757575),
                    size: 30,
                  ),
                ),
              ))),
    );
  }
}
