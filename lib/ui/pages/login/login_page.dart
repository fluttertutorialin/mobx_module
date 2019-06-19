import 'package:flutter/material.dart';
import 'package:mobx_module/constants/preferences.dart';
import 'package:mobx_module/constants/strings.dart';
import 'package:mobx_module/stores/form/form_store.dart';
import 'package:mobx_module/ui/widgets/custom_float_form.dart';
import 'package:mobx_module/ui/widgets/input_field.dart';
import 'package:mobx_module/ui/widgets/progress_indicator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //focus node
  FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  //store
  final _store = FormStore();

  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      _store.setUserId(_userEmailController.text);
    });

    _passwordController.addListener(() {
      _store.setPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: _buildBody(),
      bottomNavigationBar: new Container(
          width: MediaQuery
              .of(context)
              .size
              .width, child: _goSignUp()),
    );
  }

  Material _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          OrientationBuilder(
            builder: (context, orientation) {
              var child;
              orientation == Orientation.landscape
                  ? child = Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: _buildLeftSide(),
                        ),
                        Expanded(
                          flex: 1,
                          child: _login(),
                        ),
                      ],
                    )
                  : child = Center(child: _login());

              return child;
            },
          ),
          Observer(
            name: 'navigate',
            builder: (context) {
              return _store.success
                  ? _navigate(context)
                  : showErrorMessage(context, _store.errorStore.errorMessage);
            },
          ),
          Observer(
            name: 'loading',
            builder: (context) {
              return Visibility(
                visible: _store.loading,
                child: CustomProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.grey.withOpacity(0.2),
          child: Icon(Icons.person, color: Colors.black),
        ),
      ],
    );
  }

  _login() => ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[_loginForm()],
      );

  _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            _buildLeftSide(),
            SizedBox(height: 30.0),
            _inputEmail(),
            SizedBox(height: 10.0),
            _inputPassword(),
            SizedBox(height: 5.0),
            _goForgotPassword(),
            SizedBox(height: 10.0),
            _buttonLogin()
          ],
        ),
      ),
    );
  }

  _inputEmail() {
    return Observer(
      builder: (context) {
        return InputField(
          hint: Strings.hint_email,
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.userEmail,
        );
      },
    );
  }

  _inputPassword() {
    return Observer(
      builder: (context) {
        return InputField(
          hint: Strings.hint_password,
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _store.formErrorStore.password,
        );
      },
    );
  }

  _goForgotPassword() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: new Text('${Strings.sign_up_forgot_password}',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),
        onPressed: () {},
      ),
    );
  }

  _buttonLogin() {
    return Container(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomFloatForm(
                icon: Icons.navigate_next,
                isMini: false,
                qrCallback: () {
                  if (_store.canLogin) {
                    _store.login();
                  } else {
                    showErrorMessage(context, 'Please fill in all fields');
                  }
                })));
  }

  _goSignUp() =>
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('${Strings.sign_up_do_not_account}',
                style: TextStyle(color: Colors.grey)),
            new FlatButton(
              child: new Text('${Strings.sign_up}',
                  style: TextStyle(
                      color: Colors.black54,
                      //decoration: TextDecoration.underline,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
              onPressed: () {

              },
            ),
          ],
        ),
      );

  showErrorMessage(BuildContext context, String message) {
    if (message != null) {}
    return Container();
  }

  _navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }
}
