import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:notifriend/core/ui/loading_overlay.dart';
import 'package:notifriend/models/auth/login_request.dart';
import 'package:notifriend/pages/Home/home_page.dart';
import 'package:notifriend/theme/app_theme.dart';


class LoginPage extends ConsumerStatefulWidget with AppServices {
   LoginPage({super.key});

   static const String routeName = '/login';

   @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0B0B),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: SizedBox(
                    height: 72,
                    width: 272,
                    child: Image(
                      image: AppImages.logo,
                    ),
                  )),
              SizedBox(height: 64),
              _buildInputField(
                'Eposta Adresiniz',
                _emailController,
                Icons.email_outlined,
              ),
              SizedBox(height: 32),
              _buildInputField('Şifre', _passwordController, Icons.lock_outline,
                  isPassword: true),
              SizedBox(height: 16),
              _buildForgotPasswordField(context),
              SizedBox(height: 16),
              _buildSignInButton(context),
              SizedBox(height: 16),
              Text(
                'or',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              _buildSocialButtons(),
              SizedBox(height: 48),
              Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String labelText, TextEditingController controller, IconData icon,
      {bool isPassword = false}) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Color(0xFF7C82A1),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xFF7C82A1)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        obscureText: isPassword,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildForgotPasswordField(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Implement your forgot password logic here
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          // Implement your login logic here
          _loginOnPressed();
          // If login is successful, navigate to MainPage
        },
        child: Text(
          'Sign In',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 12),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF475AD7)),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        InkWell(
          onTap: null,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent, // Transparent background
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.google,
                    color: Colors.green,
                  ),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 32),
        InkWell(
          onTap: null,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent, // Transparent background
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign in with Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterField(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Implement your forgot password logic here
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> _loginOnPressed() async {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      // await LoadingOverlay.show();

     var loginResponse = await widget.authService.login(
        LoginRequest(
          email: email,
          password: password,
        ),
      );

     if(loginResponse.success == true) {
       widget.navigationService
           .navigateToNamedAndRemoveUntil(HomePage.routeName);
     }


      }
  }
}
