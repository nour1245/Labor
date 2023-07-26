import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboar/generated/l10n.dart';

class CatigoriesScreen extends StatelessWidget {
  CatigoriesScreen({super.key});
  List grids = [
    {"image": "assets/images/hourly.png", "title": S.current.HourlyCleaning},
    {"image": "assets/images/car wash.png", "title": S.current.CarWash},
    {"image": "assets/images/plumbing.png", "title": S.current.plumbing},
    {"image": "assets/images/electrical.png", "title": S.current.Electrical},
    {
      "image": "assets/images/contract.png",
      "title": S.current.ContractCleaning
    },
    {"image": "assets/images/condition.png", "title": S.current.Conditioning}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: media.width,
              height: media.height,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
  }

  gridViewItem(media, index) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: media.width * 0.25,
            height: media.height * 0.16,
            child: Image(
              image: AssetImage(
                grids[index]['image'],
              ),
            ),
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
