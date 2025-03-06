import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/registration_page/view/registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home_screen/view/home_screen.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final namecontroller = TextEditingController();
  final pcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  late SharedPreferences preferences;
  late bool newuser;

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
        backgroundColor: ColorTheme.secondarycolor,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          SizedBox(
            height: size * 100,
          ),
          Text("Welcome Back !!", style: GlobalTextStyles.secondTittle),
          Padding(
            padding: EdgeInsets.only(
                left: size * 35, right: size * 35, top: size * 100),
            child: TextFormField(
              controller: namecontroller,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: ColorTheme.maincolor),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: ColorTheme.maincolor,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Username',
                contentPadding: EdgeInsets.symmetric(horizontal: size * 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size * 35, right: size * 35, top: size * 30),
            child: TextFormField(
              controller: pcontroller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: ColorTheme.maincolor,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(horizontal: size * 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none),
              ),
              style: TextStyle(color: ColorTheme.maincolor),
            ),
          ),
          SizedBox(
            height: size * 40,
          ),
          Container(
            width: size * 250,
            decoration: BoxDecoration(
                color: ColorTheme.maincolor,
                borderRadius: BorderRadius.circular(size * 7)),
            child: ElevatedButton(
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                List<String>? userListJson = preferences.getStringList('users');
                if (userListJson != null && userListJson.isNotEmpty) {
                  List<User> userList = userListJson
                      .map((userJson) => User.fromJson(json.decode(userJson)))
                      .toList();
                  String enteredName = namecontroller.text;
                  String enteredPassword = pcontroller.text;
                  User? user;
                  try {
                    user =
                        userList.firstWhere((user) => user.name == enteredName);
                  } catch (e) {
                    user = null;
                  }
                  if (user != null && user.pword == enteredPassword) {
                    await _writeName(enteredName);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    namecontroller.text = "";
                    pcontroller.text = "";
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Username or password is incorrect")));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("No users registered yet")));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.maincolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
              child: Text("Login", style: GlobalTextStyles.buttonText),
            ),
          ),
          SizedBox(height: size * 260),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => RegistrationScreen()));
            },
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Don't have account ?  ",
                    style: GoogleFonts.lato(
                        decoration: TextDecoration.none,
                        fontSize: size * 14,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: " Sign Up",
                    style: GoogleFonts.lato(
                        color: ColorTheme.maincolor,
                        decoration: TextDecoration.none,
                        fontSize: size * 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ]))));
  }
}

Future<File> _getLocalFile() async {
  final directory = await getApplicationDocumentsDirectory();
  return File('${directory.path}/name.txt');
}

Future<void> _writeName(String name) async {
  final file = await _getLocalFile();
  await file.writeAsString(name);
}

Future<String> _readName() async {
  try {
    final file = await _getLocalFile();
    String name = await file.readAsString();
    return name;
  } catch (e) {
    // If encountering an error, return empty string
    return '';
  }
}
