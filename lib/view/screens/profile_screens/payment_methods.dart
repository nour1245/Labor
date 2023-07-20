import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboar/blocs/constants/constants.dart';
import 'package:laboar/view/screens/profile_screens/addcard.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentMethods extends StatelessWidget {
  PaymentMethods({super.key});
  var cards;
  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot<Object?>>? card = firebaseFirestore
        .collection('users')
        .doc('user${currentuser['phone']}')
        .collection('cards')
        .doc()
        .snapshots();
    var media = MediaQuery.of(context).size;
    return StreamBuilder<DocumentSnapshot>(
        stream: card,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
              body: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      CreditCardUi(
                        cardType: CardType.credit,
                        cardHolderFullName: '',
                        cardNumber: '1234567812345678',
                        validThru: '10/24',
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            bottom: media.height * .04),
                        child: DefaultButton(
                            height: media.height * 0.07,
                            width: media.width * 0.70,
                            text: Text('+ Add Card'),
                            funq: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddCard(),
                                  ));
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
