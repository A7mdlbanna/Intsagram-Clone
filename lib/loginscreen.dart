import 'package:flutter/material.dart';
import 'package:flutterapp/signup.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'Icons/custom_icons3_icons.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> userinfoEP = {"ahmedbanna200@gmail.com" : "1234"};
  Map<String, String> userinfoUP = {"A7mdlbanna" : "1234"};

  bool show = false;

  bool foundEmail = false;

  bool validEmail = false;
  bool validPassword = false;

  bool emailTapped = false;
  bool passwordTapped = false;

  var emailBorderColor = Colors.blue;
  var passwordBorderColor = Colors.blue;

  var emailLabelColor = Colors.white54;
  var passwordLabelColor = Colors.white54;

  var emailIcon ;
  var passwordIcon;

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus =  FocusNode();

  bool isValidEmail(String email) => RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email)  && !foundEmail && email.isNotEmpty;
  bool isValidPassword(String password) => RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 22),
                    child: Text(
                      "Instagram",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontFamily: "instagram"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,),
                    child: TextFormField(
                      focusNode: emailFocus,
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        suffixIcon: emailIcon,
                        labelText: 'Email',
                        labelStyle: TextStyle(color: emailFocus.hasFocus ? emailBorderColor : emailLabelColor),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: emailBorderColor), borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: validEmail ? Colors.white54 : (emailTapped ? Colors.red : Colors.white54)), borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),

                      onChanged: (value){
                        emailTapped =  true;
                        for (var key in userinfoEP.keys) {
                          value ==  key ?
                          setState(() {
                            emailLabelColor = Colors.white54; emailBorderColor = Colors.blue; foundEmail = false;})
                              : setState(() {
                            emailLabelColor = Colors.red; emailBorderColor = Colors.red; foundEmail = true;});
                        }
                        isValidEmail(value) ?
                        setState((){emailLabelColor = Colors.white54;validEmail = true; emailIcon = Icon(Icons.check_circle_outline_rounded, color: Colors.white54,); emailBorderColor = Colors.blue;})
                            : setState((){emailLabelColor = Colors.red;validEmail = false; emailIcon = Icon(Icons.cancel_outlined, color: Colors.red,); emailBorderColor = Colors.red;});
                      },
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.only(bottom: 15,),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: passwordFocus,
                    controller: _passwordController,
                    onChanged: (value){
                      passwordTapped =  true;
                      isValidPassword(value) ?
                      setState((){passwordLabelColor = Colors.white54; passwordLabelColor = Colors.white54;validPassword = true; passwordIcon = Icon(Icons.check_circle_outline_rounded, color: Colors.white70,); passwordBorderColor = Colors.blue;})
                          : setState((){passwordLabelColor = Colors.red; validPassword = false; passwordIcon = Icon(Icons.cancel_outlined, color: (passwordTapped ? Colors.red : Colors.white54)); passwordBorderColor = Colors.red;});
                    },
                    obscureText: !show,
                    decoration:  InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        icon: show ? Icon(Icons.visibility, color: Colors.blue,) : Icon(Icons.visibility_off, color: Colors.white54,),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: passwordFocus.hasFocus ? passwordBorderColor : passwordLabelColor),
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: passwordBorderColor), borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: validPassword ? Colors.white54 : (passwordTapped ? Colors.red : Colors.white54)), borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    height: 42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                          for (var key in userinfoEP.keys) {
                            if (_emailController.text == key) {
                              if (_passwordController.text == userinfoEP[key]){
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(builder : (context) => const HomeScreen())
                                );
                              }
                              else{
                                showDialog(
                                  context: context,
                                  builder: (context) =>   Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0)
                                      ),
                                      backgroundColor: Colors.white,
                                      elevation: 5.0,
                                      contentPadding: EdgeInsets.only(top:15, right: 30, left: 30,),
                                      title: const Center(
                                        child: Text(
                                          'Forgotten password?',
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                                        ),
                                      ),
                                      content: const Text(
                                        'We can send you an email to help you get back into your account',
                                        textAlign: TextAlign.center,
                                        style:  TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          height: 1.4,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: double.infinity,
                                            decoration:  const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black12,
                                                  width: 0.9,
                                                ),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Text(
                                                  'Send Email',
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Container(
                                            // width: double.infinity,
                                            decoration:  const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black12,
                                                  width: 0.9,
                                                ),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Text(
                                                  'Try Again',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }
                            else{
                              showDialog(
                                  context: context,
                                  builder: (context) =>  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20),
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0)
                                      ),
                                      elevation: 5.0,
                                      contentPadding: EdgeInsets.only(top:15, right: 30, left: 30,),
                                      title: const Center(
                                        child: Text(
                                          'Can\'t Find Account',
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                                        ),
                                      ),
                                      titlePadding: EdgeInsets.only(top: 30),
                                      content: Text(
                                        'We can\'t find account ${_emailController.text}. Try another phone number or email, or if you don\'t have an instagram account, you can sign up.',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          height: 1.4,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Container(
                                            width: double.infinity,
                                            decoration:  const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black12,
                                                  width: 0.9,
                                                ),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Text(
                                                  'Try Again',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async{
                                              final userinfo = await Navigator.pushNamed(
                                                context,
                                                '/signup',
                                                arguments: userinfoEP
                                              );
                                            // setState(() {
                                            //   userinfoEP = userinfo;
                                            // });
                                          },
                                          child: Container(
                                            // width: double.infinity,
                                            decoration:  const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black12,
                                                  width: 0.9,
                                                ),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Text(
                                                  'Sign up',
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              );
                            }
                          }
                        // });
                      },
                      color: Colors.blue,
                      child: Text(
                        'log in',
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade100),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10, bottom: 30),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget password?',
                        style: TextStyle(color: Colors.blue.shade100),

                      ),
                    ),
                  ),
                  Row(
                      children: const <Widget>[
                        Expanded(child: Divider(thickness: 0.7, color: Colors.white24,)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("OR", style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),),
                        ),
                        Expanded(child: Divider(thickness: 0.7, color: Colors.white24,)),
                      ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: MaterialButton(
                      onPressed: (){
                        setState(() {
                        });
                      },
                      child: Row(
                        children: const[
                          Icon(CustomIcons3.fblogo, size: 55,),
                          Text(
                              'Continue as Ahmed El Banna',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white38,
              width: 0.7,
            ),
          ),
        ),
        child: BottomAppBar(
          elevation: 10,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?', style: TextStyle(color: Colors.white38, fontSize: 13),),
              TextButton(
                onPressed: () async {
                  final userdata = await Navigator.pushNamed(
                    context,
                    '/signup',
                    arguments: userinfoEP,
                  );
                  // setState(() {
                  //   userinfoEP = userdata;
                  // });
                },
                child: Text(
                    'Sign up.',
                    style: TextStyle(color: Colors.blue.shade700, fontSize: 13),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
