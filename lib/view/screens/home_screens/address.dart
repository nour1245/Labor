import 'package:flutter/material.dart';
import 'package:laboar/view/styles/colors.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(media.width * .04),
            child: Card(
              color: greenColor,
              child: Padding(
                padding: EdgeInsets.all(media.width * .04),
                child: Row(
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    const Column(
                      children: [
                        Text("City"),
                        Text("data"),
                        Text("Street"),
                        Text("data"),
                      ],
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    const Column(
                      children: [
                        Text("build number"),
                        Text("data"),
                        Text("dsasada"),
                        Text("data"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
