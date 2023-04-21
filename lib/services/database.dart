import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;
List<Map<String, dynamic>> allBooks = [];

class FireStore {
  final time = DateTime.now().toLocal().toString().substring(0, 19);

  ///////////////////////
  /// createBook, updateBook, deleteBook functions are for Admins.
  ///////////////////////

  Future createBook({
    required String bookId,
    required String title,
    required String author,
    required String publisher,
    required String description,
    required int noOfPages,
    required String publishingDate,
  }) async {
    final doc = db.collection('allBooks').doc(bookId);

    final json = {
      'bookId': bookId,
      'title': title,
      'author': author,
      'publisher': publisher,
      'description': description,
      'noOfPages': noOfPages,
      'publishingDate': publishingDate,
      'createdAt': time,
      'modifiedAt': time,
    };

    await doc.set(json);
  }

  Future createBookRating({
    required String bookId,
    required List<int> ratings,
  }) async {
    final doc = db.collection('allBooks').doc(bookId).collection('ratings').doc(user.uid);

    final json = {
      'ratings': ratings,
      'ratedAt': time,
    };

    await doc.set(json);
  }

  Stream<List> readBooks({required String orderBy, required bool descending}) => db
      .collection('allBooks')
      .orderBy(orderBy, descending: descending)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Future updateBook({
    required String bookId,
    required String title,
    required String author,
    required String publisher,
    required String description,
    required int noOfPages,
    required String publishingDate,
  }) async {
    final doc = db.collection('books').doc(bookId);

    final json = {
      'title': title,
      'author': author,
      'publisher': publisher,
      'description': description,
      'noOfPages': noOfPages,
      'publishingDate': publishingDate,
      'modifiedAt': time,
    };

    await doc.update(json);
  }

  Future deleteBook({
    required String bookId,
    required String title,
    required String author,
    required String publisher,
    required String description,
    required int noOfPages,
    required String publishingDate,
  }) async {
    final doc = db.collection('deleted').doc(bookId);

    final json = {
      'bookId': bookId,
      'title': title,
      'author': author,
      'publisher': publisher,
      'description': description,
      'noOfPages': noOfPages,
      'publishingDate': publishingDate,
      'deletedAt': time,
    };

    await doc.set(json);
  }
}
