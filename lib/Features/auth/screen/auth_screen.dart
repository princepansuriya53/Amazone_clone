// ignore_for_file: non_constant_identifier_names,
import 'package:flutter/material.dart';
import 'package:amazon_clone/Common/widget/coustom_text_field.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/Common/widget/custombutton.dart';

enum Auth { Sign_in, Sign_up }
class Authscreen extends StatefulWidget {
  static const String routName = '/auth-screen';
  const Authscreen({
    Key? key,
  }) : super(key: key);

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  Auth _auth = Auth.Sign_up;

  final _sign_upFormkey = GlobalKey<FormState>();

  final _sign_inFormkey = GlobalKey<FormState>();

  final TextEditingController _email_Controller = TextEditingController();
  final TextEditingController _password_Controller = TextEditingController();
  final TextEditingController _name_Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name_Controller.dispose();
    _email_Controller.dispose();
    _password_Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                )),
            ListTile(
              tileColor: _auth == Auth.Sign_up
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text('Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              leading: Radio(
                value: Auth.Sign_up,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
                activeColor: GlobalVariables.secondaryColor,
              ),
            ),
            if (_auth == Auth.Sign_up)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _sign_upFormkey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _name_Controller,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _email_Controller,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _password_Controller,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(onTap: () {}, text: "Sign Up")
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.Sign_in
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text('Sign-in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              leading: Radio(
                value: Auth.Sign_in,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
                activeColor: GlobalVariables.secondaryColor,
              ),
            ),
            if (_auth == Auth.Sign_in)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _sign_upFormkey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _email_Controller,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _password_Controller,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(onTap: () {}, text: "Sign Up")
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
