import 'package:fidelizaapp/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  final AuthController auth;
  const LoginPage({Key key, this.title = "Login", this.auth}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.errorMessage = "";
    controller.isLoading = false;
    controller.isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    controller.formKey.currentState.reset();
    controller.errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      controller.isLoginForm = !controller.isLoginForm;
    });
  }

  bool validateAndSave() {
    final form = controller.formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    print('validateAndSubmit >> ');
    setState(() {
      controller.errorMessage = "";
      controller.isLoading = true;
      print('valisetState dateAndSubmit >> ');
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (controller.isLoginForm) {
          userId =
              await controller.sigIn(controller.email, controller.password);
          print('Signed in: $userId');
        } else {
          userId =
              await widget.auth.signUp(controller.email, controller.password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          controller.isLoading = false;
        });

        if (userId != null && userId.length > 0 && controller.isLoginForm) {
          Modular.to.pushReplacementNamed('/home/'); //widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          controller.isLoading = false;
          controller.errorMessage = e.message;
          controller.formKey.currentState.reset();
        });
      }
    } else {
      controller.isLoading = false;
    }
  }

  void googleLogin() async {
    setState(() {
      controller.errorMessage = "";
      controller.isLoading = true;
      print('valisetState googleLogin >> ');
    });
    try {
      var user = await controller.loginWithGoogle();
      setState(() {
        controller.isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        controller.isLoading = false;
        controller.errorMessage = e.message;
        controller.formKey.currentState.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter login demo'),
        ),
        body: Stack(
          children: <Widget>[
            _showForm(),
            _showCircularProgress(),
          ],
        ));
  }

  Widget _showCircularProgress() {
    if (controller.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(25.0),
        child: new Form(
          key: controller.formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showLogo(),
              _signInButton(),
              Center(
                child: Padding(
                  child: Text('Nome App'),
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                ),
              ),
              showEmailInput(),
              showPasswordInput(),
              showPrimaryButton(),
              showSecondaryButton(),
              showErrorMessage(),
            ],
          ),
        ));
  }

  Widget showErrorMessage() {
    if (controller.errorMessage.length > 0 && controller.errorMessage != null) {
      return new Text(
        controller.errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget showLogo() {
    return Hero(
      tag: 'ftv',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 100.0,
          child: Image.asset('assets/google_logo.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email inválido' : null,
        onSaved: (value) => controller.email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Senha inválida' : null,
        onSaved: (value) => controller.password = value.trim(),
      ),
    );
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text(
            controller.isLoginForm
                ? 'Criar uma nova conta nova'
                : 'Já tem conta? Entrar',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: new Text(controller.isLoginForm ? 'Entrar' : 'Criar Conta',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget wGoogle() {
    return
        //===
        SizedBox(
      height: 40.0,
      child: new RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.redAccent,
        child: new Text('Google Login',
            style: new TextStyle(fontSize: 15.0, color: Colors.white)),
        onPressed: googleLogin,
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: googleLogin,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Entrar com Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
