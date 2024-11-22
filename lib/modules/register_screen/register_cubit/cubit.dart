
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skin_disease_detection/modules/register_screen/register_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_model.dart';


class RegisterCubit extends Cubit<RegisterState>
{
  RegisterCubit() : super(initialRegisterState());

  static RegisterCubit get(context) =>BlocProvider.of(context);

  void userRegister({
  required String name,
  required String email,
  required String password,
  required String phone,

  })
{
  print("creat users");
  FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password
  );
}



}