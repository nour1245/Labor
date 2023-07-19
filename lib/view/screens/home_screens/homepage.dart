import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/blocs/authcubit/auth_cubit.dart';
import 'package:laboar/blocs/authcubit/auth_state.dart';
import 'package:laboar/view/screens/home_screens/Catigories.dart';
import 'package:laboar/view/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../blocs/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List grids = [
    {"image": "assets/images/hourly.png", "title": "Hourly Cleaning"},
    {"image": "assets/images/car wash.png", "title": "Car Wash"},
    {"image": "assets/images/plumbing.png", "title": "plumbing"},
    {"image": "assets/images/electrical.png", "title": "Electrical"}
  ];

  @override
  Widget build(BuildContext context) {
    PageController adsController = PageController();
    var media = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: media.width * 0.03, end: media.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none),
                ),
                SizedBox(height: media.height * 0.04),
                Row(
                  children: [
                    Text(
                      DateTime.now().hour > 19 ? "Good Night" : "Good Morning",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${currentuser['name']}',
                      style: const TextStyle(
                          color: yallowColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.04,
                ),
                const Text(
                  'Find your home service            '
                  'Need a helping hand today?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.height * 0.04,
                ),
                //location box
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGreenColor,
                  ),
                  padding: EdgeInsetsDirectional.all(media.height * 0.01),
                  width: media.width * 0.90,
                  child: Row(
                    children: [
                      SizedBox(
                        height: media.height * 0.06,
                        child: const Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.01,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'your location',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: lightGrayColor),
                            ),
                            Text(
                              'Jiddah Alexander Language School , ALS',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //ad box
                SizedBox(
                  width: media.width * 0.90,
                  height: media.height * 0.18,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: adsController,
                    itemBuilder: (context, index) => adItem(media),
                  ),
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: adsController,
                    count: 3,
                    effect: const ScrollingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: greenColor,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Row(
                  children: [
                    const Text(
                      'Our Servies',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CatigoriesScreen(),
                        ));
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            color: greenColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: grids.length,
                    itemBuilder: (BuildContext context, int index) {
                      return gridViewItem(media, index);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  adItem(media) {
    return Container(
      padding: EdgeInsetsDirectional.all(media.height * 0.01),
      width: media.width * 0.90,
      height: media.height * 0.18,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/images/adbaner.png'),
        ),
      ),
    );
  }

  gridViewItem(media, index) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(grids[index]['image']),
          ),
          Padding(
            padding: EdgeInsets.all(media.height * 0.01),
            child: Text(
              grids[index]['title'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
