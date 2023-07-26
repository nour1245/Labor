import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/view/styles/colors.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    int balance = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Wallet),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: darkgreenColor,
            child: Row(
              children: [
                const Icon(
                  Icons.wallet,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  children: [
                    Text(
                      S.of(context).Balance,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      '$balance',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                balance = balance + 1000;
              });
            },
            child: const Text('Add 1000\$ to your balance '),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                balance = balance + 2000;
              });
            },
            child: const Text('Add 2000\$ to your balance '),
          ),
        ],
      ),
    );
  }
}
