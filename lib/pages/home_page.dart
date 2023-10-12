import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stripe_app/data/data.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/pages.dart';
import 'package:stripe_app/widgets/widgets.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        actions: [
          IconButton(
            onPressed: () async {
              
              // mostrarLoading(context);
              // await Future.delayed( const Duration( seconds: 1) );
              // if( !context.mounted ) return;
              // Navigator.pop(context);
              mostrarAlerta(context, 'Hola', 'Mundo' );
              

            },
             icon: const Icon( Icons.add )
          )
        ],
      ),
      body: Stack(
        children: [

          Positioned(
            width: size.width,
            height: 380,
            // bottom: 0,
            child: IconButton(
              onPressed: () async {
                Navigator.push(context, navegarFadeIn(context, const TarjetaPage() ));
                // print('funciona');
              },
               icon: const Icon( FontAwesomeIcons.creditCard, color: Colors.white,)
            ),
          ),

          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.88
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: ( _, index) {
          
                final tarjeta = tarjetas[index];
          
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, navegarFadeIn(context, const TarjetaPage() ));
                  },
                  child: Hero(
                    tag: tarjeta.cardNumber,
                    child: CreditCardWidget(
                      cardNumber: tarjeta.cardNumberHidden,
                      expiryDate: tarjeta.expiracyDate,
                      cardHolderName: tarjeta.cardHolderName,
                      cvvCode: tarjeta.cvv,
                      // isChipVisible: false,
                      showBackView: false,
                      onCreditCardWidgetChange: (CreditCardBrand brand ) {
                        
                      },
                    ),
                  ),
                );
                
                
              },
            ),
          ),

          const Positioned(
            bottom: 0,
            child: TotalPayButton()
          )

        ],
      )
   );
  }
}