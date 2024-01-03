import 'package:flutter/material.dart';
import 'package:flutter_signup_screen/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email, _password;
  bool _showPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "LOG IN",
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
                          'Login',
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
                            'Not Registered?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage(title: 'Sign UP',)),
                                );
                              },
                              child: Text('Sign UP'))
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