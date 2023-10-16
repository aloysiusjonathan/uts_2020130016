import 'package:flutter/material.dart';
import 'package:uts_2020130016/homescreen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double quarterScreenHeight = MediaQuery.of(context).size.height / 4;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: quarterScreenHeight,
            color: Colors.transparent,
            child: Image.asset('assets/images/toko.jpg', fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          _buildTextRow('Welcome to KYRAMERCH', alignment: TextAlign.center),
          const SizedBox(height: 20),
          _buildTextRow('Email', fontSize: 16.0, alignment: TextAlign.start),
          _buildTextFieldRow(context, 'example@test.com'),
          const SizedBox(height: 10),
          _buildTextRow('Password', fontSize: 16.0, alignment: TextAlign.start),
          _buildTextFieldRow(context, 'Enter password', obscureText: true),
          const SizedBox(height: 5),
          _buildButtonRow(context, 'Log In', onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Padding _buildTextRow(String text,
      {double fontSize = 36.0, TextAlign alignment = TextAlign.center}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: alignment,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildTextFieldRow(BuildContext context, String hintText,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: const Color.fromARGB(255, 73, 73, 73)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                obscureText: obscureText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildButtonRow(BuildContext context, String text,
      {required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40.0,
            height: MediaQuery.of(context).size.height / 16,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 218, 12, 129),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width - 40.0,
                      MediaQuery.of(context).size.height / 16,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 40.0,
                  height: MediaQuery.of(context).size.height / 16,
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
