import 'package:flutter/material.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/main.dart';
import 'package:laboar/view/widgets/activebutton.dart';
import 'package:laboar/view/widgets/history_card.dart';
import 'package:laboar/view/widgets/notactivebutton.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

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
              Text(
                S.of(context).History,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
                          ? ActiveMenuButton(
                              text: S.of(context).Ongoing, media: media)
                          : NotActiveMenuButton(
                              text: S.of(context).Ongoing, media: media),
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
                          ? NotActiveMenuButton(
                              text: S.of(context).Past, media: media)
                          : ActiveMenuButton(
                              text: S.of(context).Past, media: media),
                    ),
                  ],
                ),
              ),
              isOnePressed
                  ? SizedBox(
                      width: media.width,
                      height: media.height * .70,
                      child: ListView.separated(
                        itemCount: ordersBox!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return HistroyCard(
                              date: ordersBox!.getAt(index)['date'] ??
                                  DateTime.now(),
                              worker:
                                  ordersBox!.getAt(index)['nat'] ?? "indian",
                              type: 'on review',
                              media: media,
                              jobName: ordersBox!.getAt(index)['service'],
                              jobId: '25ds458126fs5dha');
                        },
                      ),
                    )
                  : HistroyCard(
                      date: ordersBox!.getAt(0)['date'] ?? DateTime.now,
                      worker: ordersBox!.getAt(0)['nat'] ?? 'indian',
                      type: 'Canceld',
                      media: media,
                      jobName: S.of(context).CarWash,
                      jobId: '25ds45g53dha'),
            ],
          ),
        ),
      ),
    );
  }
}
