import 'package:flutter/material.dart';
import 'package:laboar/view/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController adsController = PageController();
    var media = MediaQuery.of(context).size;
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
            const Row(
              children: [
                Text(
                  'Good Morning ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  'User',
                  style: TextStyle(
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
              child: Expanded(
                child: Row(
                  children: [
                    Container(
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
            ),

            //ad box
            Container(
              width: media.width * 0.90,
              height: media.height * 0.18,
              child: PageView.builder(
                itemCount: 3,
                controller: adsController,
                itemBuilder: (context, index) => addItem(media),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return gridViewItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  addItem(media) {
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

  gridViewItem() {
    return Card(
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/hourly.png'),
          ),
          Text(
            'hourly Cleaning',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
