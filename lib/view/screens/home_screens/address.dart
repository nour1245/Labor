import 'package:flutter/material.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/main.dart';
import 'package:laboar/view/screens/home_screens/add_address.dart';
import 'package:laboar/view/widgets/text_button.dart';

import '../../widgets/addresscard.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

bool selectedAdress = false;

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAdressScreen(),
                    ));
              },
              icon: const Icon(Icons.add_rounded))
        ],
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(media.width * .04),
            child: SizedBox(
              height: media.height * 0.68,
              child: ListView.separated(
                itemCount: address!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return AddressCard(
                    index: index,
                    selectedAdress: selectedAdress,
                  );
                },
              ),
            ),
          ),
          DefaultButton(
            height: media.height * .06,
            width: media.width * 0.90,
            text: Text(S.of(context).Select),
            funq: () {},
          ),
        ],
      ),
    );
  }
}
