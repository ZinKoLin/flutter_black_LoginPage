import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_signup_screen/login.dart';

void main() {
  runApp(const MyApp());
}

ColorScheme defaultColorScheme = const ColorScheme(
  primary: Color(0xffBB86FC),
  secondary: Color(0xff03DAC6),
  surface: Color(0xff181818),
  background: Color(0xff121212),
  error: Color(0xffCF6679),
  onPrimary: Color(0xff000000),
  onSecondary: Color(0xff000000),
  onSurface: Color(0xffffffff),
  onBackground: Color(0xffffffff),
  onError: Color(0xff000000),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String? _fName, _lName, _email, _password;
  bool _showPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onSaved: (str) {
                                _fName = str;
                              },
                              validator: (str) {
                                if (str == null || str.trim().isEmpty) {
                                  return 'Please Enter First Name';
                                }
                                ;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'First Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              onSaved: (str){
                                _lName = str;
                              },
                              validator: (str){
                                if(str == null || str.trim().isEmpty){
                                  return'Please Enter Last Name';
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Last Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onSaved: (value)=> _email = value ,
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return 'Please Fill Email';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Enter Your Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onSaved: (newValue) => _password = newValue ,
                        validator: (value){
                          if(value == null || value.trim().isEmpty)
                          return 'Please Fill Password'; 
                
                        },
                        obscureText: !this._showPassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState?.save();// save
                    if(_formKey.currentState!.validate()){ //check null
                      setState(() {
                      // ="Name is ${_name}\n ";
                         
                    });
                    }
                        },
                        child: Text(
                          'Sign UP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                            backgroundColor: Color(0xffBB86FC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already Registered?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: Text('Sign in'))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
