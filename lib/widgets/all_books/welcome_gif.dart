// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/services.dart' show rootBundle;
// // import 'package:flare_flutter/flare_actor.dart';
//
// class WelcomeGif extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:  Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//       Image.memory(
//       (rootBundle.load('assets/welcome/welcome.gif')).buffer.asUint8List(),
//     ),
//           Image.asset('assets/welcome/welcome.gif'),
//           FlareActor(
//             "assets/welcome/welcome.gif",
//             alignment: Alignment.center,
//             fit: BoxFit.contain,
//             // animation: "Untitled", // Название анимации в файле
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class WelcomeGif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Lottie.network(
            //   'https://assets5.lottiefiles.com/packages/lf20_tzgkqzam.json',
            //   height: 200,
            //   width: 200,
            //   reverse: true,
            //   animate: true,
            // ),
            SizedBox(height: 20),
            Lottie.asset(
              'assets/welcome/animation_book.json',
              height: 300,
              width: 300,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}