import 'package:flutter/material.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/main.dart';
import 'package:laboar/view/screens/auth_screens/login.dart';
import 'package:laboar/view/screens/home_screens/address.dart';
import 'package:laboar/view/screens/home_screens/edit_profile.dart';
import 'package:laboar/view/screens/home_screens/wallet.dart';
import 'package:laboar/view/screens/profile_screens/payment_methods.dart';
import 'package:laboar/view/screens/welcome_pages/language_screen.dart';
import 'package:laboar/view/widgets/card.dart';
import 'package:laboar/view/widgets/text_button.dart';

class ProfileScreen extends StatelessWidget {
  bool isNotfiOn = true;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                S.of(context).Profile,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
              text: Text(
                S.of(context).Edit,
                style: const TextStyle(
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
              details: S.of(context).Addyourcreditdebitcards,
              title: S.of(context).PaymentMethods,
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
              details: S.of(context).AddyourHomeLocation,
              title: S.of(context).Location,
            ),
            DefaultCard(
              arrow: false,
              iconswitch: Switch.adaptive(
                value: false,
                onChanged: (value) {},
              ),
              icon: Icons.notifications_active_rounded,
              media: media,
              ontap: () {},
              details: S.of(context).Fordailyupdateandothers,
              title: S.of(context).PushNotification,
            ),
            DefaultCard(
              arrow: true,
              iconswitch: Switch.adaptive(
                value: false,
                onChanged: (value) {},
              ),
              icon: Icons.language,
              media: media,
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LanguageScreen(),
                    ));
              },
              details: "",
              title: S.of(context).LanguageSelect,
            ),
            DefaultCard(
              arrow: true,
              iconswitch: Switch.adaptive(
                value: false,
                onChanged: (value) {},
              ),
              icon: Icons.wallet,
              media: media,
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WalletScreen(),
                    ));
              },
              details: "",
              title: S.of(context).Wallet,
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
              details: S.of(context).Formoreinformation,
              title: S.of(context).ContactUs,
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
              title: S.of(context).Logout,
            ),
          ],
        ),
      ),
    );
  }
}
