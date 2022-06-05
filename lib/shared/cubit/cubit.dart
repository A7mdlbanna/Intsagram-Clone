import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_view/gif_view.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutterapp/shared/cubit/states.dart';


class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

//////////////////NumberScreen/////////////////////////////
 Widget textAnimate = AnimatedTextKit(
      animatedTexts: [
        RotateAnimatedText(
            'You are all set',
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold,color:  Colors.white),
            duration: const Duration(seconds: 2),
            rotateOut: false
        ),
      ],
      totalRepeatCount: 1,
    );
////////////////////////////////////////////////////////////

  bool isDisabledButton = true;
  void setButtonStateByAge(){

  }  void setButtonStateByNumber(){

  }
  late int maxValue = 31;

  late DateTime now = DateTime.now();

  late  int currentDay = now.day;
  late  int currentMonth = now.month;
  late  int currentYear = now.year;

  late  DateTime birthday = DateTime(currentYear, currentMonth, currentDay);
  late  int age = ((now.difference(birthday).inDays)/365).round();


  void changeCurrentDay (value) {
    currentDay = value;

    birthday = DateTime(currentYear, currentMonth, currentDay);
    age = now.difference(birthday).inDays;
    age = (age / 365).round();
    if(age > 6)changeIsPressedState(false);
    age > 6 && !isError ? changeButtonColor(Colors.blue): changeButtonColor(Colors.grey.shade700);

    emit(AppChangeCurrentDayState());
  }
  void changeCurrentMonth (value) {
    currentMonth = value;


    if(currentMonth == 2 && currentDay > 28) {
      currentDay = 28;
      maxValue = 28;
    }
    else if(currentMonth == 2) {
      maxValue = 28;
    }
    else if((currentMonth == 11 || currentMonth == 9 || currentMonth == 6 || currentMonth == 4) && currentDay == 31) {
      currentDay = 30;
      maxValue = 30;
    }
    else if(currentMonth == 11 || currentMonth == 9 || currentMonth == 6 || currentMonth == 4) {
      maxValue = 30;
    }
    else{
      maxValue = 31;
    }

    birthday = DateTime(currentYear, currentMonth, currentDay);
    age = now.difference(birthday).inDays;
    age = (age / 365).round();
    if(age > 6)changeIsPressedState(false);
    age > 6 && !isError ? changeButtonColor(Colors.blue): changeButtonColor(Colors.grey.shade700);

    emit(AppChangeCurrentMonthState());
  }
  void changeCurrentYear (value) {
    currentYear = value;

    birthday = DateTime(currentYear, currentMonth, currentDay);
    age = now.difference(birthday).inDays;
    age = (age / 365).round();
    if(age > 6)changeIsPressedState(false);
    age > 6 && !isError ? changeButtonColor(Colors.blue): changeButtonColor(Colors.grey.shade700);

    emit(AppChangeCurrentYearState());
  }



  bool isError = true;
  void changeErrorState(bool value){
   isError = !value;
   print(isError);
   age > 6 && !isError ? changeButtonColor(Colors.blue): changeButtonColor(Colors.grey.shade700);

   emit(AppChangeErrorState());
  }

  bool isPressed = false;
  void changeIsPressedState(value){
    isPressed = value;
    emit(AppChangeIsPressedState());
  }

  Color buttonColor = Colors.grey.shade700;
  changeButtonColor(Color color){
    buttonColor = color;
    emit(AppChangeButtonColor());
  }

  //////////////////DataBase///////////////////


  String email = '';
  String username = '';
  String number = '';
  String password = '';

  void getValidNumber(String Number) {
    Number = Number.replaceAll(" ", "");
    if (Number.length == 10) {
      Number = "0" + Number;
    }
    number = Number;
  }

  void changeEmailValue(value){
    email = value;
    emit(AppChangeEmailValue());
  }
  void changeUsernameValue(value){
    username = value;
    emit(AppChangeUsernameValue());
  }
  void changeNumberValue(value){
    number = value;
    emit(AppChangeNumberValue());
  }
  void changePasswordValue(value){
    password = value;
    emit(AppChangePasswordValue());
  }



  List<Map> users = [];
  Database? database;
  void createDatabase() {
    openDatabase(
        'todo.dp', version: 1,
        onCreate: (database, version) {
          print('database created');
          database
              .execute(
              'CREATE TABLE user (id INTEGER PRIMARY KEY, email TEXT, username TEXT, number TEXT,password TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print('Error When Creating Table ${error.toString}');
          });
        }, onOpen: (database) {
      // getFromDatabase(database).then((value){
      //   users = value;
      //   print(users);
      //   emit(AppGetFromDatabaseState());
      //   });
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase(){
      database?.transaction((txn) async{
       return await txn.rawInsert(
        'INSERT INTO user(email, username , number, password) VALUES("hi", "hi" , "hi" ,"hi")',
      )
       .then((value) {
        print('inserted successfully');
        emit(AppInsertToDatabaseState());
        // getFromDatabase(database).then((value){
        //   users = value;
        //   print(users);
        //   emit(AppGetFromDatabaseState());
        });
      // });
      //      .catchError((error) {
      //   print('Error When Inserting New Record ${error.toString()}');
      // });
    });
  }
  Future<List<Map>> getFromDatabase(database) async{
        emit(AppGetFromDatabaseLoadingState());
    return await database.rawQuery('SELECT * FROM user');
        // emit(AppGetFromDatabaseState());
        // .then((value) {
        // users = value;
        // print(users);
    // });
  }

  // void loginFromDatabase(database, email, username, password) {
  //
  //   emit(AppGetFromDatabaseLoadingState());
  //   database.rawQuery('SELECT * FROM user').then((value) {
  //     value.forEach((element){
  //       if(element['email'] == '$email' && element['username'] == '$username' && element['password'] == '$password') {
  //
  //       }
  //     });
  //     emit(AppGetFromDatabaseState());
  //   });
  // }
  //
  // void updateData({required String status, required int id}) {
  //     database.rawUpdate(
  //       'UPDATE user SET status = ? WHERE id = ?',
  //       [status, id]).then((value) {
  //       // getFromDatabase(database);
  //       emit(AppUpdateDatabaseState());
  //     });
  //
  // }
  // void  deleteData({required int id}){
  //   database.rawDelete(
  //       'DELETE FROM user WHERE id = ?', [id])
  //       .then((value) {
  //         // getFromDatabase(database);
  //         emit(AppDeleteDatabaseState());
  //       });
  // }
}


