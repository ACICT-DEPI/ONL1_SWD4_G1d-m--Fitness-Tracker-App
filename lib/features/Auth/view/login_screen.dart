import 'package:final_project/features/Auth/view/sign_up_screen.dart';
import 'package:final_project/features/Auth/view/widgets/custom_Auth_button.dart';
import 'package:final_project/features/Auth/view/widgets/custom_background.dart';
import 'package:final_project/features/Auth/view/widgets/custom_text_form_field.dart';
import 'package:final_project/features/Home/presentation/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utls/colors.dart';
import '../../Home/presentation/views/wedgits/animation_background.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is AuthSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView(),));
        }
      },
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomBackground(),
          // Container(
          //   height: MediaQuery.of(context).size.height /3,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 70.0),
          //       child: Image(image: AssetImage('assets/images/main.png')),
          //     )),
          //Image(image: AssetImage('assets/images/pngegg.png')),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/pngegg.png')),
                  CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colorsapp.navyBlue),
                      errorStyle: TextStyle(color: Colorsapp.navyBlue),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colorsapp.navyBlue)
                      ),
                          ),
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
                    decoration: InputDecoration(
                        labelText: 'Password',
                      labelStyle: TextStyle(color: Colorsapp.navyBlue),
                      errorStyle: TextStyle(color: Colorsapp.navyBlue),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colorsapp.navyBlue)
                      ),
                      suffixIcon: const Icon(CupertinoIcons.eye_slash),
                      suffixIconColor: Colorsapp.navyBlue,
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
                  CustomAuthButton(
                    text: "Login",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AuthCubit.get(context).signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passController.text);
                        }
                      },
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ", style: TextStyle(color: Colorsapp.navyBlue)),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:  (context) => SignUpScreen(),));
                        },
                          child: Text("Sign up", style: TextStyle(color: Colorsapp.primarycolor),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
