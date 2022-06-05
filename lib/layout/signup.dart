import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/shared/cubit/cubit.dart';
import 'package:flutterapp/shared/cubit/states.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Icons/custom_icons3_icons.dart';
import 'PhoneNumber/number_screen.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Map<String, String> userinfo = {'' : ''};

  final Uri _url = Uri.parse('https://github.com/A7mdlbanna');
  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  bool show = false;

  bool validEmail = false;
  bool validName = false;
  bool validUserName = false;
  bool validPassword = false;
  bool isDisabledButton() =>  validEmail && validUserName && validPassword ? false : true;

  bool isValidEmail(String email) => RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email)  && !foundEmail && email.isNotEmpty;
  bool isValidPassword(String password) => RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);

  bool emailTapped = false;
  bool nameTapped = false;
  bool usernameTapped = false;
  bool passwordTapped = false;

  var emailBorderColor = Colors.blue;
  var nameBorderColor = Colors.blue;
  var usernameBorderColor = Colors.blue;
  var passwordBorderColor = Colors.blue;

  var emailLabelColor = Colors.white54;
  var nameLabelColor = Colors.white54;
  var usernameLabelColor = Colors.white54;
  var passwordLabelColor = Colors.white54;


  bool foundEmail = false;
  bool foundUsername = false;
  var emailIcon ;
  var nameIcon ;
  var usernameIcon;
  var passwordIcon;

  var _emailController = TextEditingController();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus =  FocusNode();
  FocusNode usernameFocus =  FocusNode();
  FocusNode passwordFocus =  FocusNode();

  @override
  Widget build(BuildContext context) {
    var userdataEP = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
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
                              color: Colors.white24,
                              fontSize: 70,
                              fontFamily: "instagram"),
                        ),
                      ),
                      const Text(
                        'Sign up to see photos and videos from your friends.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 5),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              _launchUrl();
                            });
                          },
                          child: Row(
                            children: const[
                              Icon(CustomIcons3.fblogo, size: 55,),
                              Text(
                                'Log in with Facebook',
                                style: TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: const <Widget>[
                          Expanded(child: Divider(
                            thickness: 0.7, color: Colors.white24,)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("OR", style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold),),
                          ),
                          Expanded(child: Divider(
                            thickness: 0.7, color: Colors.white24,)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7, top: 20),
                        child: TextFormField(
                          focusNode: emailFocus,
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: emailIcon,
                            labelText: 'Email',
                            labelStyle: TextStyle(color: emailFocus.hasFocus
                                ? emailBorderColor
                                : emailLabelColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: emailBorderColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: validEmail
                                  ? Colors.white54
                                  : (emailTapped ? Colors.red : Colors
                                  .white54)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)),
                            ),
                          ),

                          onChanged: (value) {
                            emailTapped = true;
                            for (var key in userdataEP.keys) {
                              value != key ?
                              setState(() {
                                emailLabelColor = Colors.white54;
                                emailBorderColor = Colors.blue;
                                foundEmail = false;
                              })
                                  : setState(() {
                                emailLabelColor = Colors.red;
                                emailBorderColor = Colors.red;
                                foundEmail = true;
                              });
                            }
                            isValidEmail(value) ?
                            setState(() {
                              emailLabelColor = Colors.white54;
                              validEmail = true;
                              emailIcon = Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.white54,);
                              emailBorderColor = Colors.blue;
                            })
                                : setState(() {
                              emailLabelColor = Colors.red;
                              validEmail = false;
                              emailIcon = Icon(
                                Icons.cancel_outlined, color: Colors.red,);
                              emailBorderColor = Colors.red;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7,),
                        child: TextFormField(
                          focusNode: nameFocus,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            nameTapped = true;
                            value.length > 1 ?
                            setState(() {
                              nameLabelColor = Colors.white54;
                              validName = true;
                              nameIcon = Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.white54,);
                              nameBorderColor = Colors.blue;
                            })
                                : setState(() {
                              nameLabelColor = Colors.red;
                              validName = false;
                              nameIcon = Icon(
                                Icons.cancel_outlined, color: Colors.red,);
                              nameBorderColor = Colors.red;
                            });
                          },

                          decoration: InputDecoration(
                            suffixIcon: nameIcon,
                            labelText: 'Full Name',
                            labelStyle: TextStyle(color: nameFocus.hasFocus
                                ? nameBorderColor
                                : nameLabelColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: nameBorderColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: validName
                                  ? Colors.white54
                                  : (nameTapped ? Colors.red : Colors.white54)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7,),
                        child: TextFormField(
                          focusNode: usernameFocus,
                          onChanged: (value) {
                            // for (var key in widget.userinfoUP.keys) {
                            //   value !=  key ?
                            //   setState(() {usernameLabelColor = Colors.white54; usernameBorderColor = Colors.blue; foundUsername = false;})
                            // : setState(() {usernameLabelColor = Colors.red; usernameBorderColor = Colors.red; foundUsername = true;});
                            // }
                            usernameTapped = true;
                            value.length > 1 && !foundUsername ?
                            setState(() {
                              usernameLabelColor = Colors.white54;
                              validUserName = true;
                              usernameIcon = Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.white54,);
                              usernameBorderColor = Colors.blue;
                            })
                                : setState(() {
                              usernameLabelColor = Colors.red;
                              validUserName = false;
                              usernameIcon = Icon(
                                Icons.cancel_outlined, color: Colors.red,);
                              usernameBorderColor = Colors.red;
                            });
                          },
                          controller: _usernameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            suffixIcon: usernameIcon,
                            labelText: 'Username',

                            labelStyle: TextStyle(color: usernameFocus.hasFocus
                                ? usernameBorderColor
                                : usernameLabelColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: usernameBorderColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: validUserName
                                  ? Colors.white54
                                  : (nameTapped ? Colors.red : Colors.white54)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15,),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          focusNode: passwordFocus,
                          controller: _passwordController,
                          onChanged: (value) {
                            passwordTapped = true;
                            isValidPassword(value) ?
                            setState(() {
                              passwordLabelColor = Colors.white54;
                              passwordLabelColor = Colors.white54;
                              validPassword = true;
                              passwordIcon = Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.white70,);
                              passwordBorderColor = Colors.blue;
                            })
                                : setState(() {
                              passwordLabelColor = Colors.red;
                              validPassword = false;
                              passwordIcon = Icon(Icons.cancel_outlined,
                                  color: (passwordTapped ? Colors.red : Colors
                                      .white54));
                              passwordBorderColor = Colors.red;
                            });
                          },
                          obscureText: !show,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  show = !show;
                                });
                              },
                              icon: show ? Icon(
                                Icons.visibility, color: Colors.blue,) : Icon(
                                Icons.visibility_off, color: Colors.white54,),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: passwordFocus.hasFocus
                                ? passwordBorderColor
                                : passwordLabelColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: passwordBorderColor),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)),),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: validPassword
                                  ? Colors.white54
                                  : (passwordTapped ? Colors.red : Colors
                                  .white54)),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8.0)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: MaterialButton(
                            color: Colors.blue,
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey.shade100),
                            ),
                            onPressed: isDisabledButton() ? () {} :
                                () {
                              print(_emailController.text);
                              print(_usernameController.text);
                              print(_passwordController.text);
                              cubit.changeEmailValue(_emailController.text);
                              cubit.changeUsernameValue(_usernameController.text);
                              cubit.changePasswordValue(_passwordController.text);
                              print(cubit.email);
                              print(cubit.username);
                              print(cubit.password);
                              Navigator.pushNamed(
                                context,
                                '/NumberScreen',
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white54,
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
                    Text('Have an account?',
                      style: TextStyle(color: Colors.white60, fontSize: 15),),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/loginScreen',
                          );
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(color: Colors.blue.shade300,
                              fontSize: 15),
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
