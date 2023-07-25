import 'package:flutter/material.dart';
import 'package:laboar/main.dart';
import 'package:laboar/view/screens/auth_screens/login.dart';
import 'package:laboar/view/screens/home_screens/address.dart';
import 'package:laboar/view/screens/home_screens/edit_profile.dart';
import 'package:laboar/view/screens/profile_screens/payment_methods.dart';
import 'package:laboar/view/widgets/card.dart';
import 'package:laboar/view/widgets/text_button.dart';

class ProfileScreen extends StatelessWidget {
  bool isNotfiOn = true;

  ProfileScreen({super.key});

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
            child: Image(
              fit: BoxFit.contain,
              image: NetworkImage(
                userbox!.getAt(0) != null ? userbox!.getAt(0)['photo'] : '',
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.02,
          ),
          Text(
            userbox!.getAt(0) != null ? userbox!.getAt(0)['name'] : 'null',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
            funq: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ));
            },
          ),
          SizedBox(
            height: media.height * 0.06,
          ),
          DefaultCard(
            arrow: true,
            iconswitch: Switch.adaptive(
              value: false,
              onChanged: (value) {},
            ),
            icon: Icons.payment,
            media: media,
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethods(),
                  ));
            },
            details: "Add your credit & debit cards",
            title: "Payment Methods",
          ),
          DefaultCard(
            arrow: true,
            iconswitch: Switch.adaptive(
              value: false,
              onChanged: (value) {
                isNotfiOn = value;
              },
            ),
            icon: Icons.location_on,
            media: media,
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddressScreen(),
                  ));
            },
            details: "Add your Home Location ",
            title: "Location",
          ),
          DefaultCard(
            arrow: false,
            iconswitch: Switch.adaptive(
              value: false,
              onChanged: (value) {},
            ),
            icon: Icons.abc,
            media: media,
            ontap: () {},
            details: "For daily update and others",
            title: "Push Notification",
          ),
          DefaultCard(
            arrow: true,
            iconswitch: Switch.adaptive(
              value: false,
              onChanged: (value) {},
            ),
            icon: Icons.phone_in_talk_outlined,
            media: media,
            ontap: () {},
            details: "For more information",
            title: "Contact Us",
          ),
          DefaultCard(
            arrow: true,
            iconswitch: Switch.adaptive(
              value: false,
              onChanged: (value) {},
            ),
            icon: Icons.exit_to_app,
            media: media,
            ontap: () async {
              userbox!.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            details: "",
            title: "Logout",
          ),
        ],
      ),
    );
  }
}
