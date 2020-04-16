import 'package:fidelizaapp/app/repositories/promocao_repository.dart';
import 'package:fidelizaapp/app/repositories/usuario_repository.dart';
import 'package:fidelizaapp/app/shared/auth/auth_controller.dart';
import 'package:fidelizaapp/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:fidelizaapp/app/shared/models/promocao_model.dart';
import 'package:fidelizaapp/app/shared/models/usuario_model.dart';

import 'package:fidelizaapp/app/shared/utils/handler_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController authController = Modular.get();
  final authRepository = Modular.get<IAuthRepository>();
  final usuarioRepository = Modular.get<UsuarioRepository>();
  final promocaoRepository = Modular.get<PromocaoRepository>();

  @observable
  bool loading = false;

  final formKey = new GlobalKey<FormState>();
  String email;
  String password;
  String errorMessage;
  bool isLoginForm;
  bool isLoading;

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await authController.loginWithGoogle();
      print('login ok');
      await inserirUsuario();
      Modular.to.pushReplacementNamed('/home/');
    } catch (e) {
      print('login erro: ${e.toString()}');
      loading = false;

      errorMessage = HandlerMessage.errorGoogleLogin(e.toString());
    }
  }

  @action
  Future<String> sigIn(String email, String password) async {
    await authController.signIn(email, password).then((value) async {
      await inserirUsuario();
    });
  }

  @action
  Future<String> sigUp(String email, String password) async {
    return await authController.signUp(email, password);
  }

  Future<void> inserirUsuario() async {
    print('inserirUsuario >>');
    await authRepository.getCurrentUser().then((user) async {
      if (user != null) {
        print(' inserirUsuario userID= ${user?.uid}');

        await promocaoRepository.gravarPromocao(getPromocao());

        UsuarioModel usuario = new UsuarioModel(
          id: user?.uid,
          nome: user?.displayName,
          eMail: user?.email,
          ativo: true,
          perfil: "CLIENTE_FREE",
          promocoes: [],
          interesses: [],
          configuracoes: Configuracoes(
            notificacoes: true,
            publicidade: true,
            quantidadeAcesso: 1,
            versaoApp: "1.0",
          ),
        );

        await usuarioRepository.inserirUsuario(user?.uid, usuario);
      } else {
        print('inserirUsuario >> erro na tentativa de inserir o usuaŕio');
      }
    });
  }

  void verificarUsuario() {
    print('verificarUsuario >>');
    authRepository.getCurrentUser().then((user) {
      if (user != null) {
        print(' verificarUsuario userID= ${user?.uid}');
        usuarioRepository.verificarCadastroUsuario(user?.uid);
      } else {
        print('verificarUsuario >> erro na tentativa de recuperar o usuaŕio');
      }
    });
  }

  PromocaoModel getPromocao() {
    PromocaoModel promocao = PromocaoModel(
        descricao: 'descrição',
        detalhes: 'Detalhes',
        estabelecimento: 'Nome Estabelecimento',
        estabelecimentoId: 'id estabelecimento',
        endereco: 'endereço',
        cidade: 'cidade',
        estado: 'estado',
        cep: 'cep',
        localizacao: 'localizalização',
        fone: 'fone',
        eMail: 'e-mail',
        site: 'site',
        dataCriacao: 'data criação',
        status: 'status',
        ativa: true,
        acumulativa: true,
        repetivel: true,
        dataInicio: 'data inicio',
        dataFim: 'data fim',
        categoria: 'categoria',
        notificacoes: true,
        qtdSelos: 10,
        dataUpdate: 'data update');
    return promocao;
  }
}
