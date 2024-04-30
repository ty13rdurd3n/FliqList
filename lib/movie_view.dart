// ignore_for_file: sized_box_for_whitespace

import 'package:fliqlist/constants.dart';
import 'package:fliqlist/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:defer_pointer/defer_pointer.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  void exit() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: DeferredPointerHandler(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Opacity(
                opacity: 0.75,
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF221F1F), Color(0xFF000000)])),
                ),
              ),
              Positioned(
                  top: -35,
                  child: DeferPointer(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 55,
                        width: 190,
                        decoration: BoxDecoration(
                            color: const Color(0xFFE50914),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(color: Color(0xFFE50914), blurRadius: 6)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                size: 37,
                                color: Color(0xFFF5F5F1),
                              ),
                              Text(
                                "Already Added !",
                                style: GoogleFonts.openSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFF5F5F1)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        body: Container(
          height: height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: ScrollController(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 27),
                  child: Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: height / 1.7,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.movie.posterUrl)),
                            color: const Color(0xFFE50914),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 40,
                            left: 20,
                            child: GestureDetector(
                              onTap: () => {exit()},
                              child: Container(
                                height: 51,
                                width: 51,
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      )
                                    ]),
                                child: const Icon(
                                  FontAwesomeIcons.circleXmark,
                                  color: Color(0xFFF5F5F1),
                                  size: 30,
                                ),
                              ),
                            )),
                        Positioned(
                          bottom: -52.5,
                          right: 33,
                          height: 105,
                          width: 105,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFF221F1F),
                                borderRadius:
                                    BorderRadiusDirectional.circular(52.5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  )
                                ]),
                            child: const Icon(
                              FontAwesomeIcons.solidBookmark,
                              size: 50,
                              color: Color(0xFFE50914),
                            ),
                          ),
                        ),
                      ]),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20),
                      height: 35,
                      width: 106,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE50914),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "IMDB ${widget.movie.imdbRating}",
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: const Color(0xFF221F1F),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: width,
                      margin:
                          const EdgeInsets.only(left: 20, top: 15, right: 20),
                      child: Text(
                        widget.movie.title,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                            fontSize: 30,
                            color: const Color(0xFFF5F5F1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
