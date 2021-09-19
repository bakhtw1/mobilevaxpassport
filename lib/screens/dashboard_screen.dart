// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vax_pass_flutter/models/user.dart';
import 'package:vax_pass_flutter/screens/sign_in_screen.dart';
import 'package:vax_pass_flutter/screens/sign_up_screen.dart';
import 'package:vax_pass_flutter/utils/constants.dart';

import 'package:vax_pass_flutter/service/auth.dart';
import 'package:vax_pass_flutter/service/database.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen() : super();

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _auth = AuthService();
  final DatabaseService _database = DatabaseService();

  HealthRecord? _record;
  UserData? _userData;

  _DashboardScreenState() {
    _setHealthRecord();
  }

  void _setHealthRecord() async {
    String uid = _auth.getUID();
    _record = await _database.getUserHealthRecord(uid);
    _userData = await _database.getUserData(uid);
  }

  Widget _label(String label, String value) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label + ": " + value,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 20),
        ));
  }

  Widget _dosageCard(
      String dose, String agent, String prodName, String loc, String date) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: titleBoxDecorationStyle,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(dose,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 40)),
            ),
            _label("Date", date),
            _label("Agent", agent),
            _label("Product Name", prodName),
            _label("Location Administered", loc)
          ],
        ),
      ),
    );
  }

  Widget _titleCard(String date, String hcn) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: titleBoxDecorationStyle,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Waqas Bakht',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 40)),
            ),
            _label("Date of Birth", date),
            _label("Health Card No.", hcn)
          ],
        ),
      ),
    );
  }

  Widget _qrCard() {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          decoration: titleBoxDecorationStyle,
          child: QrImage(
            data: 'Waaaariq',
            version: QrVersions.auto,
            size: 350,
            gapless: false,
          )),
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
            decoration: BoxDecoration(color: Color(0xFFe63946)),
          ),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _titleCard(_record!.dateOfBirth, _userData!.healthCardNo),
                    SizedBox(height: 10),
                    _dosageCard(
                        "Dose 1",
                        "Covid-19 mRNA",
                        _record!.doseOneAgent,
                        _record!.doseOneLocation,
                        _record!.doseOneDate),
                    SizedBox(height: 10),
                    _dosageCard(
                        "Dose 2",
                        "Covid-19_mRNA",
                        _record!.doseTwoAgent,
                        _record!.doseTwoLocation,
                        _record!.doseTwoDate),
                    SizedBox(height: 10),
                    _qrCard()
                  ],
                )),
          )
        ],
      ),
    );
  }
}
