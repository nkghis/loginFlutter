import 'dart:convert';

//import 'package:day12_login/Animation/FadeAnimation.dart';
import 'package:day12_login/Animation/FadeAnimation.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
//nimport 'models/User.dart';

import 'package:shared_preferences/shared_preferences.dart';



void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code Land", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: Text("Main Page")),
      drawer: Drawer(),
    );
  }

}

/*class _HomePageState extends State<HomePage> {
	Future <User> _user;
	final _formKey = GlobalKey<FormState>();
	final _isEmpty = 'Veuillez saisir du texte';
	String _email = '';
	String _password ='';
	String _error ;
	FocusNode _emailFocusNode = FocusNode();
	FocusNode _passwordFocusNode = FocusNode();
	String _urlRoot = 'http://192.168.2.98:8000';
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	//User _user ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Form(
						key: _formKey,
	          child: Column(
	            children: <Widget>[
	              Container(
	                height: 400,
	                decoration: BoxDecoration(
	                  image: DecorationImage(
	                    image: AssetImage('assets/images/background.png'),
	                    fit: BoxFit.fill
	                  )
	                ),
	                child: Stack(
	                  children: <Widget>[
	                    Positioned(
	                      left: 30,
	                      width: 80,
	                      height: 200,
	                      child: FadeAnimation(1, Container(
	                        decoration: BoxDecoration(
	                          image: DecorationImage(
	                            image: AssetImage('assets/images/light-1.png')
	                          )
	                        ),
	                      )),
	                    ),
	                    Positioned(
	                      left: 140,
	                      width: 80,
	                      height: 150,
	                      child: FadeAnimation(1.3, Container(
	                        decoration: BoxDecoration(
	                          image: DecorationImage(
	                            image: AssetImage('assets/images/light-2.png')
	                          )
	                        ),
	                      )),
	                    ),
	                    Positioned(
	                      right: 40,
	                      top: 40,
	                      width: 80,
	                      height: 150,
	                      child: FadeAnimation(1.5, Container(
	                        decoration: BoxDecoration(
	                          image: DecorationImage(
	                            image: AssetImage('assets/images/clock.png')
	                          )
	                        ),
	                      )),
	                    ),
	                    Positioned(
	                      child: FadeAnimation(1.6, Container(
	                        margin: EdgeInsets.only(top: 50),
	                        child: Center(
	                          child: Text("PUBPIGE", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                        ),
	                      )),
	                    )
	                  ],
	                ),
	              ),
	              Padding(
	                padding: EdgeInsets.all(30.0),
	                child: Column(
	                  children: <Widget>[
	                    FadeAnimation(1.8, Container(
	                      padding: EdgeInsets.all(5),
	                      decoration: BoxDecoration(
	                        color: Colors.white,
	                        borderRadius: BorderRadius.circular(10),
	                        boxShadow: [
	                          BoxShadow(
	                            color: Color.fromRGBO(143, 148, 251, .2),
	                            blurRadius: 20.0,
	                            offset: Offset(0, 10)
	                          )
	                        ]
	                      ),
//Form Input
	                      child: Column(
	                        children: <Widget>[

	                          _inputEmail(context),

	                          _inputPassword(),
	                        ],
	                      ),
	                    )),
	                    SizedBox(height: 30,),
	                    _inputSubmit(),
//Form Input
	                    SizedBox(height: 70,),
	                    FadeAnimation(1.5, Text("Mot de passe oublié?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
	                  ],
	                ),
	              )
	            ],
	          ),
	        ),
	      ),
      )
    );
  }

  FadeAnimation _inputSubmit() {
    return FadeAnimation(2,Container(
												height: 50,
												decoration: BoxDecoration(
														borderRadius: BorderRadius.circular(10),
														gradient: LinearGradient(
																colors: [
																	Color.fromRGBO(143, 148, 251, 1),
																	Color.fromRGBO(143, 148, 251, .6),
																]
														)
												),
												child: Center(
													child: RaisedButton(

															textColor: Colors.white,
															color: Color.fromRGBO(143, 148, 251, 1),
															onPressed: () {
																// Validate will return true if the form is valid, or

																// the form is invalid.
																if (_formKey.currentState.validate()) {
																	print('Email : $_email');
																	print('Mot de passe : $_password');
																}

																setState(() {
																	_user = login(_emailController.text, _passwordController.text);
																	if(_user == null)
																		{
																			 _error = 'Les informations renseignées ne correspondent pas';
																		}

																});
															},
															child: Text("Se connecter", style: TextStyle(*//*color: Colors.white, *//*fontWeight: FontWeight.bold),)),
												),
											) );
  }

  Container _inputPassword() {
    return Container(
	                            padding: EdgeInsets.all(8.0),
	                            child: TextFormField(
																//For use text value
																controller: _passwordController,
																focusNode: _passwordFocusNode,
	                              decoration: InputDecoration(
	                                border: InputBorder.none,
	                                hintText: "Mot de passe",
	                                hintStyle: TextStyle(color: Colors.grey[400])
	                              ),
																validator: (password) => password.isEmpty ? _isEmpty : null,
																onChanged: (password) =>_password = password,
	                            ),
	                          );
  }

  Container _inputEmail(BuildContext context) {
    return Container(
	                            padding: EdgeInsets.all(8.0),
	                            //padding : EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 20.0),
	                            decoration: BoxDecoration(
	                              border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                            ),
	                            child: TextFormField(
																controller: _emailController,
																keyboardType: TextInputType.emailAddress,
																focusNode: _emailFocusNode,
																autofocus: true,
																onFieldSubmitted: (_){
																	fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
																},
	                              decoration: InputDecoration(
	                                border: InputBorder.none,
	                                hintText: "Email",
	                                hintStyle: TextStyle(color: Colors.grey[400]),
	                              ),
															validator: (email) => EmailValidator.validate(email) ?  null :'Email invalide',
															onChanged: (email) => _email = email,
	                            ),


	                          );
  }

	void fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
		currentFocus.unfocus();
		FocusScope.of(context).requestFocus(nextFocus);
	}

	Future <User> login (String email, String password) async{

		var body = jsonEncode(<String, String>{
			'email': email,
			'password': password,
		});

		var url = '$_urlRoot/api/login';


		final  response = await http.post(
			url,
			headers: <String, String>{
				'Content-Type': 'application/json; charset=UTF-8',
			},
			body:body

		);


		if (response.statusCode == 200) {
			//Create a map object
			Map<String, dynamic> userMap = jsonDecode(response.body);

			//Map
			User user = User.fromJson(userMap);
			return user;
		} else {
			throw Exception('Les informations renseignées ne correspondent pas');
		}
	}


*//*	Widget showAlert() {
		if (_error != null) {
			return Container(
				color: Colors.amberAccent,
				width: double.infinity,
				padding: EdgeInsets.all(8.0),
				child: Row(
					children: <Widget>[
						Padding(
							padding: const EdgeInsets.only(right: 8.0),
							child: Icon(Icons.error_outline),
						),
						Expanded(
							child: AutoSizeText(
								_error,
								maxLines: 3,
							),
						),
						Padding(
							padding: const EdgeInsets.only(left: 8.0),
							child: IconButton(
								icon: Icon(Icons.close),
								onPressed: () {
									setState(() {
										_error = null;
									});
								},
							),
						)
					],
				),
			);
		}
		return SizedBox(
			height: 0,
		);
	}*//*





}*/




