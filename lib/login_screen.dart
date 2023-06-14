import 'package:flutter/material.dart';
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

void sendOtp(){

}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Phone Verificaton.",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone number before getting started!",
                style: TextStyle(fontSize: 16
                ),
              textAlign: TextAlign.center,  
              ),
              ElevatedButton(
                onPressed: sendOtp , 
                child: Text("Send OTP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}