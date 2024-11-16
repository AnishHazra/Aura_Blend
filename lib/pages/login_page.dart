import 'package:flutter/material.dart';
import 'package:aura_blend/components/my_button.dart';
import 'package:aura_blend/components/my_textfield.dart';
import 'package:aura_blend/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //! login method
  void login() async {
    //! get instance of auth service
    final authService = AuthService();

    //! try sign in
    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }
    //! display any error message
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //! logo
          Icon(
            Icons.lock_open,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(height: 25),
          //! some message
          Text(
            "Elevating Taste, Redefining Dining",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 25),
          //! email textfield
          MyTextField(
            controller: emailController,
            hintText: "Email",
            obscureText: false,
          ),
          const SizedBox(height: 10),
          //! password textfield
          MyTextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),
          const SizedBox(height: 25),
          //! login button
          MyButton(
            text: "Login",
            onTap: login,
          ),
          const SizedBox(height: 25),
          //! not a member? register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Register now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
