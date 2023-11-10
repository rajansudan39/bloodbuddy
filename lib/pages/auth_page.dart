import 'package:bloodbuddy/pages/form_page.dart';
import 'package:bloodbuddy/pages/loading_screen.dart';
import 'package:bloodbuddy/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodbuddy/pages/home_page.dart';
import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return const CheckSignUp();
          }
          //user is not logged in
          else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}

class CheckSignUp extends StatefulWidget {
  const CheckSignUp({super.key});

  @override
  State<CheckSignUp> createState() => _CheckSignUpState();
}

class _CheckSignUpState extends State<CheckSignUp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: Database().userExist(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bool isExist = snapshot.data!;
          if (isExist) {
            return const HomePage();
          } else {
            return const FormPage();
          }
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
