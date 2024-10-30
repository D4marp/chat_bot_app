import 'package:chat_bot/screen/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.05,
          horizontal: screenWidth * 0.06,
        ),
        decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Logo and Title Section
              Container(
                width: screenWidth * 0.85,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.22,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.12,
                            height: screenWidth * 0.12,
                            decoration: ShapeDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/bot.png'),
                                fit: BoxFit.cover,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(screenWidth * 0.08),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            'Sign Up to Create an Account',
                            style: TextStyle(
                              color: const Color(0xFF0A0A0A),
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -1.2,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          // Sign In Text with GestureRecognizer
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Have an account? ',
                                  style: TextStyle(
                                    color: const Color(0xFF766F68),
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(
                                    color: const Color(0xFF612A74),
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LoginPage(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Form Section
                    Column(
                      children: [
                        _buildTextField('Username', screenWidth),
                        SizedBox(height: screenHeight * 0.02),
                        _buildTextField('Email', screenWidth),
                        SizedBox(height: screenHeight * 0.02),
                        _buildPasswordField(screenWidth),
                        SizedBox(height: screenHeight * 0.04),
                        // Sign Up Button
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.018,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF612A74),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(screenWidth * 0.05),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: const Color(0xFFF3EEE9),
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for text fields
  Widget _buildTextField(String label, double screenWidth) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: const Color(0xFF766F68),
          fontSize: screenWidth * 0.04,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.8, color: Color(0x33776F69)),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.2, color: Color(0xFF612A74)),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
      ),
    );
  }

  // Helper method for password field
  Widget _buildPasswordField(double screenWidth) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: const Color(0xFF766F68),
          fontSize: screenWidth * 0.04,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.8, color: Color(0x33776F69)),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.2, color: Color(0xFF612A74)),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF766F68),
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
