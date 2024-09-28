import 'package:final_project/Auth/cubit/auth_cubit.dart';
import 'package:final_project/Auth/cubit/auth_states.dart';
import 'package:final_project/Auth/view/home_screen.dart';
import 'package:final_project/Auth/view/login_screen.dart';
import 'package:final_project/Auth/widgets/custom_Auth_button.dart';
import 'package:final_project/Auth/widgets/custom_text_form_field.dart';
import 'package:final_project/core/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is AuthSuccess){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }
      },
      builder: (context, state) => Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                    suffixIcon: Icon(CupertinoIcons.eye_slash),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password is too short';
                    }
                    return null;
                  },
                obscure: true,
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPassController,
                decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  suffixIcon: Icon(CupertinoIcons.eye_slash),
                ),
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password is too short';
                    }
                    if (value != passController.text) {
                      return 'The password do not match';
                    }
                    return null;
                  },
                obscure: true,
              ),
              const SizedBox(height: 30),
              CustomAuthButton(
                  text: "SIGN UP",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       AuthCubit.get(context).signUpWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text);
                    }
                  },
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => LoginScreen(),));
                    },
                      child: Text("Login", style: TextStyle(color: primary),))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
