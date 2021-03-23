import 'package:flutter/material.dart';
import 'package:login/api/login_api.dart';
import 'package:login/model/login_model.dart';
import 'package:login/pages/register.dart';
import 'package:login/pages/register1.dart';


import '../progressHUD.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;

  LoginRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 180, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.blueAccent,
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ]),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: <Widget>[
                      //Login Text
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline2,
                      ),

                      //Email Address Field
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => requestModel.email = input,
                        validator: (input) => !input.contains("@")
                            ? "Email Id should be valid"
                            : null,
                        decoration: new InputDecoration(
                          hintText: "Email Address",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),

                      //Password Field
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (input) => requestModel.password = input,
                        validator: (input) => input.length < 3
                            ? "Password should be more than 3 characters"
                            : null,
                        obscureText: hidePassword,
                        decoration: new InputDecoration(
                          hintText: "Password",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).accentColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color:
                                Theme.of(context).accentColor.withOpacity(0.4),
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),

                      //Login Button
                      SizedBox(
                        height: 25,
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 80,
                        ),
                        onPressed: () {
                          if (validateAndSave()) {
                            setState(() {
                              isApiCallProcess = true;
                            });

                            APILogin apilogin = new APILogin();
                            apilogin.login(requestModel).then((value) {
                              setState(() {
                                isApiCallProcess = false;
                              });

                              if (value.token.isNotEmpty) {
                                final snackBar = SnackBar(
                                  content: Text("Login Successfull"),
                                );
                                scaffoldkey.currentState.showSnackBar(snackBar);
                              } else {
                                final snackBar = SnackBar(
                                  content: Text(value.error),
                                );
                                scaffoldkey.currentState.showSnackBar(snackBar);
                              }
                            });

                            print(requestModel.toJson());
                            // _navigateToNextScreen(context);
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).accentColor,
                        shape: StadiumBorder(),
                      ),

                      //Signup Link
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          'Sign up',
                          style: TextStyle(fontSize: 12,
                          color: Colors.blue),
                        ),
                        onPressed: (){
                          _navigateToNextScreen(context);
                        },

                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Register1()));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
