import 'package:flutter/material.dart';
import 'package:aura_blend/components/my_button.dart';
import 'package:aura_blend/components/my_textfield.dart';
import 'package:aura_blend/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //! register method
  void register() async {
    //! get auth service
    final authService = AuthService();

    //! check if password match
    if (passwordController.text == confirmPasswordController.text) {
      //! creating user
      try {
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    //! if password don't match
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match"),
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
            "Let's create an account for you",
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
          const SizedBox(height: 10),
          //! confirm password textfield
          MyTextField(
            controller: confirmPasswordController,
            hintText: "Confirm password",
            obscureText: true,
          ),
          const SizedBox(height: 25),
          //! sign in button
          MyButton(
            text: "Sign Up",
            onTap: register,
          ),
          const SizedBox(height: 25),
          //! already have an account? Login here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login now",
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
