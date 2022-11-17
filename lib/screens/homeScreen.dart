import 'package:flutter/material.dart';
import 'package:msgwhatsapp/components/customborder.dart';
import 'package:msgwhatsapp/components/errordialog.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController msgcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  validator() {
    if (msgcontroller.text.toString().isNotEmpty &&
        phonecontroller.text.toString().isNotEmpty) {
      if (phonecontroller.text.toString().length != 10) {
        showDialog(
          context: context,
          builder: (BuildContext c) {
            return ErrorDialog(message: "Number Should be of 10 digit");
          },
        );
      } else {
        //all good
        lastCall();
      }
    } else {
      if (msgcontroller.text.toString().isEmpty) {
        showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Please fill message",
            );
          },
        );
      }
      if (phonecontroller.text.toString().isEmpty) {
        showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Please fill Phone Number",
            );
          },
        );
      }
    }
  }

  lastCall() async {
    if (_formkey.currentState!.validate()) {
      var number = "+91" + phonecontroller.text.toString();
      var message = msgcontroller.text.toString();
      String url = "https://wa.me/$number?text=" + Uri.encodeComponent(message);
      launchurl(url);
    }
  }

  launchurl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: "Could not load link",
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Shimmer.fromColors(
            baseColor: Colors.limeAccent,
            highlightColor: Colors.teal,
            child: Text(
              "MsgWhatsApp",
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Sizer(
                    builder: (context, orientation, deviceType) {
                      return CustomTextField(
                        hintText: "Message",
                        iconData: Icons.message,
                        keytype: TextInputType.text,
                        textEditingController: msgcontroller,
                        maxline: 5,
                        minline: 3,
                      );
                    },
                  ),
                  Sizer(
                    builder: (context, orientation, deviceType) {
                      return CustomTextField(
                        maxline: 2,
                        minline: 1,
                        hintText: "Mobile Number",
                        iconData: Icons.message,
                        keytype: TextInputType.number,
                        textEditingController: phonecontroller,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade500,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => validator(),
                    //validator
                    //launcher
                    child: Shimmer.fromColors(
                      baseColor: Colors.orange,
                      highlightColor: Colors.pink,
                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: "KiwiMaru"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
