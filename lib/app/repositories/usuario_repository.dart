import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fidelizaapp/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:fidelizaapp/app/shared/models/promocao_model.dart';
import 'package:fidelizaapp/app/shared/models/usuario_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

const String USUARIO_URL = "usuarios_t";
const String PROMOCAO_URL = "promocoes_t";

class UsuarioRepository {
  //final Dio dio;
  final auth = Modular.get<IAuthRepository>();
  final databaseReference = Firestore.instance;

  UsuarioRepository();

  Future<UsuarioModel> getUsuario(String uid) async {
    databaseReference.collection(USUARIO_URL).document(uid).get().then((value){
      return UsuarioModel.fromJson(value.data);
    });
  }

  Future<UsuarioModel> inserirUsuario(String uid, UsuarioModel usuario) async {
    try {
      await verificarCadastroUsuario(uid).then((v) async {
        if (v == null) {
          try {
            await databaseReference
                .collection(USUARIO_URL)
                .document(uid)
                .setData(usuario.toJson());
            print('usuario criado com sucesso!');
          } catch (e) {
            print('erro ao inserir usuario [1]: ' + e.toString());
          }
        } else {
          print('usuário já existe');
        }
      });
    } catch (e) {
      print('erro ao inserir usuario [2]: ' + e.toString());
    }
  }

  Future<String> verificarCadastroUsuario(String uid) async {
    print('Repo >>> verificarCadastroUsuario >>');

    final snapshot =
        await databaseReference.collection(USUARIO_URL).document(uid).get();

    if (snapshot.exists) {
      print('usuario existe!!!!!');
      return uid;
    } else {
      print('usuario Não existe!!!!!');
      return null;
    }
  }
}
