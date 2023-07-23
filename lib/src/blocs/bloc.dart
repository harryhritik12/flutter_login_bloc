
import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
class Bloc  extends Object with  Validator{
  final _email=BehaviorSubject<String>();
  final _password=BehaviorSubject<String>();
  
  //Function(String)  get changeEmail=>_emailController.sink.add;

//add data tostring
Stream<String> get email=>_email.stream.transform(validateEmail);
Stream<String> get password=>_password.stream.transform(validatePassword);
Stream<bool> get submitValid=>
      Rx.combineLatest2(email, password,(e,p)=>true);


 // change data 

Function(String ) get changeEmail=>_email.sink.add;
Function(String) get changePassword=>_password.sink.add;

submit(){
  final validEmail=_email.value;
  final validPassword=_password.value;

  print('Email is $validEmail');
  print('Password $validPassword');

}

dispose(){
  _email.close();
  _password.close();
}



}
//final bloc=Bloc(); // global  instance
