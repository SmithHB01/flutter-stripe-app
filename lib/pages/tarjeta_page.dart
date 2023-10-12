import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:stripe_app/models/models.dart';
import 'package:stripe_app/widgets/widgets.dart';


class TarjetaPage extends StatelessWidget {
  const TarjetaPage({super.key});


  @override
  Widget build(BuildContext context) {

    final tarjeta = TarjetaCredito(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Smith Herrera'
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
      ),
      body: Stack(
        children: [

          Container(),

          Hero(
            tag: tarjeta.cardNumber,
            child: CreditCardWidget(
              cardNumber: tarjeta.cardNumberHidden,
              expiryDate: tarjeta.expiracyDate,
              cardHolderName: tarjeta.cardHolderName,
              cvvCode: tarjeta.cvv,
              // isChipVisible: false,
              showBackView: false,
              onCreditCardWidgetChange: (CreditCardBrand brand ) {},
            ),
          ),

          const Positioned(
            bottom: 0,
            child: TotalPayButton()
          )
        ]
      )
   );
  }
}