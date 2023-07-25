import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  DefaultCard({
    super.key,
    required this.media,
    required this.ontap,
    required this.details,
    required this.title,
    required this.icon,
    required this.arrow,
    required this.iconswitch,
  });
  var media;
  Switch iconswitch;
  bool arrow = true;
  IconData icon;
  Function() ontap;
  String title;
  String details;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: media.width * 0.02,
      ),
      child: InkWell(
        onTap: ontap,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(media.width * 0.03),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(
                  width: media.width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      details,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Spacer(),
                arrow
                    ? Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: media.width * 0.05,
                      )
                    : iconswitch,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
