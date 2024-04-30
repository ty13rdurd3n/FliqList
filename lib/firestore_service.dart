import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDriver {
  FirestoreDriver();

  Future<void> uploadData(
      {required String email,
      required String title,
      required String imdbRating,
      required String posterUrl,
      required String runTime,
      required String year,
      required String plotDescription,
      required String imdbID}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .collection("watchlist")
        .doc(imdbID)
        .set({
      'imdbRating': imdbRating,
      'plotDescription': plotDescription,
      'posterUrl': posterUrl,
      'runTime': runTime,
      'title': title,
      'year': year
    });
  }
}
