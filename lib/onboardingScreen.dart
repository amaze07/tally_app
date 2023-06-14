import 'package:flutter/material.dart';
import 'package:tally_app/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/1.jpg",
    },
    {
      "image": "assets/images/2.jpg",
    }
  ];

  PageController pageController = PageController();

  void continueMethod() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const loginScreen()), 
      (Route<dynamic> route) => false);
  }

  int currentPage = 0;
  onChanged(int index){
    setState(() {
      currentPage = index;
    });
  }

  Color primaryColor = const Color.fromRGBO(207, 232, 250, 1);
  Color secondaryColor = const Color.fromRGBO(149, 197, 225, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                itemCount: onboardingData.length,
                onPageChanged: onChanged,
                itemBuilder: (context, index) {
                  return buildOnboardingPage(
                    image: onboardingData[index]['image']!,
                    screenHeight: screenHeight,
                    applyPadding: index == 0,
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  (currentPage == (onboardingData.length - 1)) ? 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor, // Set your desired background color here
                    ),
                    onPressed: continueMethod,
                     child: const Text(
                      "CONTINUE",
                      style: TextStyle(
                        color: Color.fromRGBO(207, 232, 250, 1),
                        ),
                      ),
                  )
                  :Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      onboardingData.length, 
                      (index) {
                        return AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 200,
                          ),
                          height: 10,
                          width: (index == currentPage) ? 15 : 10,
                          margin: const EdgeInsets.only(bottom: 50, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == currentPage) ? secondaryColor : Colors.white,
                          ),
                        );
                      },
                    ) 
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildOnboardingPage({
    required String image,
    required double screenHeight,
    required bool applyPadding,
  }) {
    return Center(
      child: Column(
        children: [
          if (applyPadding)
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.1),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                height: 550,
                width: 550,
              ),
            )
          else
            Image.asset(
              image,
              fit: BoxFit.contain,
            ),
        ],
      ),
    );
  }
}
