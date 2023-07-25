import 'package:flutter/material.dart';

import '../styles/colors.dart';

class HistroyCard extends StatelessWidget {
  HistroyCard(
      {super.key,
      required this.media,
      required this.jobName,
      required this.jobId,
      required this.type,
      required this.date,
      required this.worker});
  var media;
  String worker;
  String type;
  String date;
  String jobName;
  String jobId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(media.width * 0.02),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        jobId,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Spacer(),
                  type == "Accpet"
                      ? Padding(
                          padding: EdgeInsets.all(media.height * 0.01),
                          child: Container(
                            alignment: Alignment.center,
                            width: media.width * 0.21,
                            height: media.height * 0.04,
                            decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text(
                              "Accpet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      : type == 'on review'
                          ? Padding(
                              padding: EdgeInsets.all(media.height * 0.01),
                              child: Container(
                                alignment: Alignment.center,
                                width: media.width * 0.21,
                                height: media.height * 0.04,
                                decoration: BoxDecoration(
                                  color: Colors.grey[600],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Text(
                                  "on review",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          : type == "completed"
                              ? Padding(
                                  padding: EdgeInsets.all(media.height * 0.01),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: media.width * 0.21,
                                    height: media.height * 0.04,
                                    decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Text(
                                      "completed",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              : type == "Canceld"
                                  ? Padding(
                                      padding:
                                          EdgeInsets.all(media.height * 0.01),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: media.width * 0.21,
                                        height: media.height * 0.04,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: const Text(
                                          "Canceld",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    )
                                  : const Text(''),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: media.width * 0.06,
                    backgroundImage:
                        const AssetImage('assets/images/google_icon.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: media.width * 0.02,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'United Group Company',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: yallowColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: lightGrayColor),
                  ),
                ],
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: media.width * 0.07, end: media.width * 0.04),
                child: Row(
                  children: [
                    Text(
                      worker,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    const Column(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "1600",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
