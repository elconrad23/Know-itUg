import 'package:flutter_svg/flutter_svg.dart';

import '../../knowit_exporter.dart';

class KnowItSplash extends StatelessWidget {
  const KnowItSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              knowItColor,
              knowItTeal,
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            knowItMiniSvg,
            height: 80,
            width: 80,
          ),
        ),
      ),
    );
  }
}
