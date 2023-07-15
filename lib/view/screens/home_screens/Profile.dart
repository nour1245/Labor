import 'package:flutter/material.dart';
import 'package:laboar/view/components/card.dart';
import 'package:laboar/view/components/text_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: media.height * 0.06),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            width: media.height * 0.10,
            height: media.height * 0.10,
            child: const Image(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          SizedBox(
            height: media.height * 0.02,
          ),
          const Text(
            'USEr NAME',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: media.height * 0.02,
          ),
          DefaultButton(
            height: media.height * 0.04,
            width: media.width * 0.20,
            text: const Text(
              "Edit",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            funq: () {},
          ),
          SizedBox(
            height: media.height * 0.06,
          ),
          DefaultCard(
            icon: Icons.payment,
            media: media,
            ontap: () {},
            details: "Add your credit & debit cards",
            title: "Payment Methods",
          ),
          DefaultCard(
            icon: Icons.location_on,
            media: media,
            ontap: () {},
            details: "Add your Home Location ",
            title: "Location",
          ),
          DefaultCard(
            icon: Icons.notifications,
            media: media,
            ontap: () {},
            details: "For daily update and others",
            title: "Push Notification",
          ),
          DefaultCard(
            icon: Icons.phone_in_talk_outlined,
            media: media,
            ontap: () {},
            details: "For more information",
            title: "Contact Us",
          ),
          DefaultCard(
            icon: Icons.exit_to_app,
            media: media,
            ontap: () {},
            details: "",
            title: "Logout",
          ),
        ],
      ),
    );
  }
}
