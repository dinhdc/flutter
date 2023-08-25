import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listicle/components/input_field.dart';
import 'package:listicle/utils/style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _emailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();

  bool isPaid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Row(
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromRGBO(79, 99, 172, 1)),
              Text(
                'Sign Up',
                style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(79, 99, 172, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextInputField(
                textEditingController: _nameInputController,
                labelString: "Name",
                hintString: "Cong Dinh",
              ),
              const SizedBox(
                height: 30,
              ),
              TextInputField(
                textEditingController: _emailInputController,
                labelString: "E-mail",
                hintString: "example@gmail.com",
              ),
              const SizedBox(
                height: 30,
              ),
              TextInputField(
                textEditingController: _passwordInputController,
                labelString: "Password",
                hintString: "example",
                isPass: true,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: const Color.fromRGBO(141, 155, 181, 1),
                      value: isPaid,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onChanged: (bool? value) {
                        setState(() {
                          isPaid = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text("I agree with", style: montserratFFW500),
                      Text("Terms", style: montserratFFW600),
                      Text(" & ", style: montserratFFW500),
                      Text("Privacy", style: montserratFFW600)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 120),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 0, right: 10.0),
                        child: const Divider(
                          color: secondaryColor,
                          height: 36,
                        )),
                  ),
                  Text(
                    "Or sign up with",
                    style: montserratFFW600,
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 0.0),
                        child: const Divider(
                          color: secondaryColor,
                          height: 36,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: darkLightColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Icon(
                    Icons.g_mobiledata_rounded,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: montserratFFW500,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: null,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/signIn");
                    },
                    child: Text(
                      "Sign In",
                      style: montserratFFW600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
