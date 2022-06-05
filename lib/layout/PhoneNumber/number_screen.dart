import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/shared/cubit/cubit.dart';
import 'package:flutterapp/shared/cubit/states.dart';
import 'package:gif_view/gif_view.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../shared/cubit/cubit.dart';

class NumberScreen extends StatelessWidget {
  NumberScreen({Key? key}) : super(key: key);


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  var numberController = TextEditingController();
  bool isError = false ;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.black,
              body: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Image(image: AssetImage("assets/number_screen/cake.jpg"),
                          width: 150,
                          height: 150,),
                        const SizedBox(height: 50,),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child: Row(
                            children: [
                              Text(DateFormat.yMMMd().format(cubit.birthday), style: const TextStyle(
                                  fontSize: 16, color: Colors.white),),
                              Expanded(child: Container(child: Text(
                                '${cubit.age >= 0 ? cubit.age : 0} Years Old', style: TextStyle(
                                  fontSize: 16, color: cubit.age > 6 ? Colors.grey.shade400 : Colors.red),),
                                alignment: Alignment.centerRight,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,bottom: 10),
                          child: Row(
                            children: [
                              const SizedBox(width: 25,),
                              Expanded(
                                child: Container(
                                  child: NumberPicker(
                                      minValue: 1,
                                      maxValue: 12,
                                      value: cubit.currentMonth,
                                      itemCount: 1,
                                      selectedTextStyle: TextStyle(color: Colors.blueGrey.shade400, fontSize: 25),
                                      onChanged: (value) => cubit.changeCurrentMonth(value)),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(width: 3.0, color: Colors.grey),
                                      bottom: BorderSide(width: 3.0, color: Colors.grey),
                                    )
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              Expanded(
                                child: Container(
                                  child: NumberPicker(minValue: 1,
                                      maxValue: cubit.maxValue,
                                      value: cubit.currentDay,
                                      itemCount: 1,
                                      selectedTextStyle: TextStyle(color: Colors.blueGrey.shade400, fontSize: 25),
                                      onChanged: (value) => cubit.changeCurrentDay(value)),
                                      decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 3.0, color: Colors.grey),
                                        bottom: BorderSide(width: 3.0, color: Colors.grey),
                                      )
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              Expanded(
                                child: Container(
                                  child: NumberPicker(minValue: 1900,
                                      maxValue: 2022,
                                      value: cubit.currentYear,
                                      itemCount: 1,
                                      selectedTextStyle: TextStyle(color: Colors.blueGrey.shade400, fontSize: 25),
                                      onChanged: (value) => cubit.changeCurrentYear(value),
                                  ),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(width: 3.0, color: Colors.grey),
                                        bottom: BorderSide(width: 3.0, color: Colors.grey),
                                      )
                                  ),
                                ),
                              ),
                              const SizedBox(width: 25,),
                            ],
                          ),
                        ),
                        Text(cubit.age < 7 && cubit.isPressed ? 'Enter a Valid Age' : '', style: const TextStyle(color: Colors.red),),
                        const SizedBox(height: 40,),
                        const Divider(thickness: 1.0, color: Colors.white70,),
                        const SizedBox(height: 10,),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text('Enter a Phone Number', style: TextStyle(fontSize: 20, color: Colors.white54,),),
                        ),
                        const SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber value){
                            },
                            textFieldController: numberController,
                            spaceBetweenSelectorAndTextField: 0,
                            selectorButtonOnErrorPadding: 0,
                            selectorConfig: const SelectorConfig(
                              useEmoji: true,
                              trailingSpace: false,
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                            inputBorder: const OutlineInputBorder(borderRadius: BorderRadius.all( Radius.circular(5.0))),
                            onFieldSubmitted: (value){
                              _formKey.currentState?.validate();
                              cubit.getValidNumber(value);
                            },
                            validator: (val) => cubit.isError ? 'Enter a Valid Number' : null,
                            initialValue: number,
                            onInputValidated: (bool value){
                              if (kDebugMode) {
                                print(value);
                              }
                              cubit.changeErrorState(value);
                            },
                          ),
                        ),
                        const SizedBox(height: 100,),
                        Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: MaterialButton(
                              color: cubit.buttonColor,
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blueGrey.shade100),
                              ),
                              onPressed: cubit.age > 6 && !cubit.isError ? () {
                                cubit.insertToDatabase();
                                // showAnimatedDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return Dialog(
                                //         backgroundColor: const Color(0xFF0F0F0F),
                                //         child: Container(
                                //           height: 200,
                                //           decoration: BoxDecoration(
                                //               borderRadius: BorderRadius.circular(40.0)),
                                //           child: Column(
                                //             mainAxisAlignment: MainAxisAlignment.center,
                                //             children: <Widget>[
                                //                GifView(
                                //                 image:  const AssetImage("assets/number_screen/CheckTrue2.gif"),
                                //                 width: 70,
                                //                 height: 70,
                                //                 frameRate: 60,
                                //                 loop: false,
                                //                 onFinish: () => Navigator.pushNamed(context, '/loginScreen'),
                                //               ),
                                //               cubit.textAnimate,
                                //               ],
                                //           ),
                                //         ),
                                //       );
                                //     },
                                //   animationType: DialogTransitionType.scale,
                                //   curve: Curves.easeOutQuart,
                                //   // duration: Duration(seconds: 2),
                                // );
                              }:
                                  (){
                                cubit.changeIsPressedState(true);
                                cubit.getValidNumber(numberController.text);
                                _formKey.currentState?.validate();
                              },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          );
        }
      ),
    );
  }
}
