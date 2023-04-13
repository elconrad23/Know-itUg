import '../../../knowit_exporter.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  onTap(){
  
  }
  
  @override
  Widget build(BuildContext context) {
    // is mobile
    final isMobile = KnowItResponsive.isMobile(context) ||
        KnowItResponsive.isSmallMobile(context) ||
        KnowItResponsive.isMediumMobile(context);



    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        maxLines: 1,
        key: ValueKey(isMobile),
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
