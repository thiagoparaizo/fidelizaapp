import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:fidelizaapp/app/shared/models/promocao_model.dart';

const String PROMOCAO_URL = "promocoes_t";

class PromocaoRepository {
  final databaseReference = Firestore.instance;

  Future<String> gravarPromocao(PromocaoModel promocao) async {
    print('gravarPromocao >>');

    try {
      DocumentReference ref = await databaseReference
          .collection(PROMOCAO_URL)
          .add(promocao.toJson());
      print('ref: ' + ref.documentID);

      print('promoção criado com sucesso!');
    } catch (e) {
      print('erro ao inserir promoção [1]: ' + e.toString());
    }
    print('gravarPromocao <<');
  }

  Future<List<PromocaoModel>> listarPromocoes() {
    var temp = databaseReference
        .collection(PROMOCAO_URL)
        .where('', isEqualTo: '')
        .snapshots();
  }

  /*
  --Update
  Future<void> updateData(String documentId, int version, String name, Timestamp date) async {
    await _firestore.collection(collection).document(documentId).updateData(
      {'androidVersion': version,
        'deviceName': name,
        'purchaseDate': date,
      }
    );
  }

  --Delete
  Future<void> deleteValue(String documentId, String value) async {
    await _firestore.collection('smartphone').document(documentId).updateData({'apps.socialMedia': FieldValue.arrayRemove([value])});
  }

  --Query
  Query where(dynamic field, {dynamic isEqualTo, dynamic isLessThan, dynamic isLessThanOrEqualTo, 
  dynamic isGreaterThan, dynamic isGreaterThanOrEqualTo, dynamic arrayContains, List<dynamic> arrayContainsAny, 
  List<dynamic> whereIn, bool isNull})
  
  --DateTime
  DateTime time = castTimestampToDateTime(snapshot.data['purchaseDate']);
  ///Timestamp to DateTime in a separately method
  castTimestampToDateTime(Timestamp data) {
    return data.toDate();
  }
  */

}
