import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboar/view/components/text_button.dart';
import 'package:laboar/view/screens/auth_screens/login.dart';
import 'package:laboar/view/screens/welcome_pages/language_screen.dart';
import 'package:laboar/view/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int curruntPage = 0;
  List pageViewDetails = [
    {
      "image": "assets/images/Group 4.png",
      "title": "Easy Process",
      "text":
          "Find all your house needs in one place. We provide every service to make your home experience smooth."
    },
    {
      "image": "assets/images/Group.png",
      "title": "Expert People",
      "text":
          "We have the best in class individuals working just for you. They are well trained and capable of handling anything you need."
    },
    {
      "image": "assets/images/Frame.png",
      "title": "All In One Place",
      "text":
          "We have all the household services you need on a daily basis with easy access"
    },
  ];

  late PageController pageViewController;
  @override
  void initState() {
    pageViewController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: media.width * 0.01),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      color: yallowColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  curruntPage = value;
                });
              },
              controller: pageViewController,
              itemCount: pageViewDetails.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return pageViewItem(context, index, media);
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: media.height * 0.08),
            child: SmoothPageIndicator(
              controller: pageViewController, // PageController
              count: pageViewDetails.length,
              effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: yallowColor,
                  dotHeight: 9,
                  dotWidth: 9), // your preferred effect
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: media.height * 0.06),
            child: DefaultButton(
                height: media.height * 0.07,
                width: media.width * 0.90,
                text: Text(curruntPage == pageViewDetails.length - 1
                    ? "Enter"
                    : "Next"),
                funq: () {
                  if (curruntPage == pageViewDetails.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }
                  pageViewController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                }),
          ),
        ],
      ),
    );
  }

  pageViewItem(context, index, media) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: media.width,
          height: media.height * 0.38,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage('${pageViewDetails[index]['image']}'),
          ),
        ),
        SizedBox(
          height: media.height * 0.04,
        ),
        Text(
          '${pageViewDetails[index]['title']}',
          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.all(media.width * 0.10),
          child: Text(
            '${pageViewDetails[index]['text']}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
