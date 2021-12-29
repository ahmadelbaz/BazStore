import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference<Map<dynamic, dynamic>>
      _categoryCollectionReference =
      FirebaseFirestore.instance.collection('Category');
  final CollectionReference<Map<dynamic, dynamic>> _productCollectionReference =
      FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>>
      getCategory() async {
    var value = await _categoryCollectionReference.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot<Map<dynamic, dynamic>>>>
      getBestSelling() async {
    var value = await _productCollectionReference.get();

    return value.docs;
  }
}
