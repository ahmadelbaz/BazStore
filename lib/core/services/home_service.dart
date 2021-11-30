import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference<Map<dynamic, dynamic>> _collectionReference =
      FirebaseFirestore.instance.collection('Category');

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>>
      getCategory() async {
    var value = await _collectionReference.get();

    return value.docs;
  }
}
