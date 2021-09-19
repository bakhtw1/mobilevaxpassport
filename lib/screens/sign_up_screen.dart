// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vax_pass_flutter/screens/sign_in_screen.dart';
import 'package:vax_pass_flutter/utils/constants.dart';
import 'package:vax_pass_flutter/screens/dashboard_screen.dart';
import 'package:vax_pass_flutter/service/auth.dart';

class SignUpForm {
  String email = '';
  String password = '';
  String healthCardNo = '';

  SignUpForm() {}
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen() : super();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _auth = AuthService();

  String _email = '';
  String _password = '';
  String _healtCardNo = '';
  String _name = '';

  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: () => {
        print('click'),
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()))
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () async {
            print(_email);
            print(_password);
            dynamic result = await _auth.registerWithEmailAndPassword(
                _email, _password, _healtCardNo, _name);
            if (result == null) {
              print('error please');
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            }
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(
            'SUBMIT',
            style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTF(String label, String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(14),
              hintText: message,
              hintStyle: kHintTextStyle,
            ),
            onChanged: (val) {
              setState(() => _email = val);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHealthCardNoTF(String label, String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(14),
              hintText: message,
              hintStyle: kHintTextStyle,
            ),
            onChanged: (val) {
              setState(() => _healtCardNo = val);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNameTF(String label, String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(14),
              hintText: message,
              hintStyle: kHintTextStyle,
            ),
            onChanged: (val) {
              setState(() => _name = val);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF(String label, String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(14),
              hintText: message,
              hintStyle: kHintTextStyle,
            ),
            onChanged: (val) {
              setState(() => _password = val);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xFF8D99AE)),
        ),
        SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  _buildEmailTF('Email', 'Enter your email'),
                  SizedBox(height: 20),
                  _buildHealthCardNoTF('Health Card No.', 'XXXX-XXX-XXX-AB'),
                  SizedBox(height: 20),
                  _buildNameTF('Name', 'Enter your full name'),
                  SizedBox(height: 20),
                  _buildPasswordTF(
                      'Confirm Password', 'Re-enter your password'),
                  SizedBox(height: 20),
                  _buildSignUpBtn(),
                  SizedBox(height: 20),
                  _buildSignInBtn()
                ],
              )),
        )
      ],
    ));
  }
}
