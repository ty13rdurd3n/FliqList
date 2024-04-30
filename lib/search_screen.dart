// ignore_for_file: unused_import, avoid_print, sized_box_for_whitespace

import 'dart:convert';
import 'package:fliqlist/constants.dart';
import 'package:fliqlist/fetch_data.dart';
import 'package:fliqlist/movie_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'components.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
class Movie {
  late String title;
  late String year;
  late String imdbRating;
  late String runTime;
  late String imdbID;
  late String plotDescription;
  late String posterUrl;
  Movie(this.title, this.year, this.imdbRating, this.imdbID, this.runTime,
      this.plotDescription, this.posterUrl);
}

List<Movie> movies = [];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(19, 45, 19, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchField(
              icon: FontAwesomeIcons.arrowLeft,
              isreadOnly: false,
              boxShadow: const BoxShadow(
                  color: Colors.black, offset: Offset(0, 2), blurRadius: 5),
              onbarTap: () {},
              oniconTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              onChange: (textInput) async {
                try {
                  await FetchData(textInput.toString())
                      .fetchList()
                      .then((value) async => {
                            if (value != null)
                              {
                                movies.clear(),
                                for (var currmovie in value['Search'])
                                  {
                                    await FetchData(
                                            currmovie['imdbID'].toString())
                                        .fetchData()
                                        .then((value) => {
                                              setState(() {
                                                movies.add(Movie(
                                                    currmovie['Title']
                                                        .toString(),
                                                    currmovie['Year']
                                                        .toString(),
                                                    value['rating'].toString(),
                                                    currmovie['imdbID']
                                                        .toString(),
                                                    value['runtime'].toString(),
                                                    currmovie['plot']
                                                        .toString(),
                                                    value['large_cover_image']
                                                        .toString()));
                                              })
                                            }),
                                  }
                              }
                          });
                } catch (error) {
                  print(error);
                }
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: movies.length,
                  controller: ScrollController(),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            createRoute(MovieCard(movie: movies[index]),
                                const Offset(0, 3.0)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        height: MediaQuery.of(context).size.height / 5.5,
                        color: const Color(0xFF323232),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          movies[index].posterUrl)),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.9,
                                  child: Text(
                                    movies[index].title,
                                    style: GoogleFonts.openSans(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFFF5F5F1)),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  movies[index].year,
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFF5F5F1)),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
