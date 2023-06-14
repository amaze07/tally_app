import 'package:flutter/material.dart';
import 'package:tally_app/onboardingScreen.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

List<Map<String, String>> splashData = [
    {
      "image": "assets/images/3.jpg",
      "title": "Tally Prime",
      "description": "Power of Simplicity",
    },
  ];

@override
void initState(){
  super.initState();
  _navigatetohome();
} 

_navigatetohome()async{
  await Future.delayed(const Duration(milliseconds: 2000), (){});
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OnBoardingScreen()));
}

  PageController pageController = PageController();

Color primaryColor = const Color.fromRGBO(207, 232, 250, 1);
Color secondaryColor = const Color.fromRGBO(149, 197, 225, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: splashData.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(50.0), // Adjust the padding as needed
                      child: Image.asset(
                        splashData[index]['image']!,
                        fit: BoxFit.contain,
                        height: 550,
                        width: 550,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}