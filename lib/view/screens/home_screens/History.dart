import 'package:flutter/material.dart';
import 'package:laboar/view/widgets/activebutton.dart';
import 'package:laboar/view/widgets/history_card.dart';
import 'package:laboar/view/widgets/notactivebutton.dart';
import 'package:laboar/view/styles/colors.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isOnePressed = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: media.height * 0.04),
        child: Center(
          child: Column(
            children: [
              const Text(
                'History',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.height * 0.03,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: media.width * 0.18, end: media.width * 0.18),
                child: Row(
                  children: [
                    //ongoing part
                    InkWell(
                      onTap: () {
                        setState(() {
                          isOnePressed = true;
                        });
                      },
                      child: isOnePressed
                          ? ActiveMenuButton(text: 'Ongoing', media: media)
                          : NotActiveMenuButton(text: 'Ongoing', media: media),
                    ),
                    const Spacer(),
                    //past part
                    InkWell(
                      onTap: () {
                        setState(() {
                          isOnePressed = false;
                        });
                      },
                      child: isOnePressed
                          ? NotActiveMenuButton(text: "Past", media: media)
                          : ActiveMenuButton(text: "Past", media: media),
                    ),
                  ],
                ),
              ),
              isOnePressed
                  ? HistroyCard(
                      media: media,
                      jobName: "contract cleaning",
                      jobId: '25ds458126fs5dha')
                  : HistroyCard(
                      media: media,
                      jobName: "contract ",
                      jobId: '25ds458126fs5dha'),
            ],
          ),
        ),
      ),
    );
  }
}
