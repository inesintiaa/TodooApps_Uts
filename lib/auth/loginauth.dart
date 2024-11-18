import 'package:utsine/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:utsine/main.dart';

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({super.key});

  @override
  State<LoginWrapper> createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  bool isLoggedIn = false;
  String loggedInEmail = '';

  void handleLogin(String email) {
    setState(() {
      isLoggedIn = true;
      loggedInEmail = email;
    });
  }

  void handleLogout() {
    setState(() {
      isLoggedIn = false;
      loggedInEmail = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? MainPage(
            loggedInEmail: loggedInEmail,
            onLogout: handleLogout, // Tambahkan fungsi logout
          )
        : LoginPage(onLogin: handleLogin);
  }
}
