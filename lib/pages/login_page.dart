import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0B0B),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 64),
              child: Image.asset('your_logo.png'),
            ),
            SizedBox(height: 64),
            _buildInputField('Eposta Adresiniz', emailController , Icons.email_outlined,),
            SizedBox(height: 32),
            _buildInputField('Şifre', passwordController, Icons.lock_outline, isPassword: true),
            SizedBox(height: 32),
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
            SizedBox(height: 16),
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
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller, IconData icon,
      {bool isPassword = false}) {
    return TextFormField(
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
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      obscureText: isPassword,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
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
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 16),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF475AD7)),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.facebook),
          onPressed: () {
            // Handle Facebook sign-in
          },
          iconSize: 40,
          color: Colors.white,
        ),
        SizedBox(width: 32),
        IconButton(
          icon: Icon(Icons.g_mobiledata),
          onPressed: () {
            // Handle Google sign-in
          },
          iconSize: 40,
          color: Colors.white,
        ),
      ],
    );
  }
}
