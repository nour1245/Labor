import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboar/generated/l10n.dart';
import 'package:laboar/main.dart';
import 'package:laboar/view/screens/profile_screens/addcard.dart';
import 'package:laboar/view/widgets/text_button.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: media.width,
            height: media.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                mybox!.length > 0
                    ? SizedBox(
                        height: media.height * 0.75,
                        child: ListView.separated(
                          itemCount: mybox!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: media.height * 0.02,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(media.height * .02),
                              child: CreditCardUi(
                                cardType: CardType.credit,
                                cardHolderFullName:
                                    '${mybox!.getAt(index)['cardName']}',
                                cardNumber:
                                    '${mybox!.getAt(index)['cardNumber']}',
                                validThru: '${mybox!.getAt(index)['expDate']}',
                              ),
                            );
                          },
                        ),
                      )
                    : Center(child: Text(S.of(context).AddCardNow)),
                const Spacer(),
                Padding(
                  padding:
                      EdgeInsetsDirectional.only(bottom: media.height * .04),
                  child: DefaultButton(
                      height: media.height * 0.07,
                      width: media.width * 0.70,
                      text: Text(S.of(context).AddCard),
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
      ),
    );
  }
}
