import '../../../knowit_exporter.dart';

class CountDownOverlay extends ConsumerWidget {
  const CountDownOverlay({
    required bool isStartPressed,
    required Function() onFinish,
    required int initialSpeed,
    Key? key,
  })  : _isStartPressed = isStartPressed,
        _onFinish = onFinish,
        _kInitialSpeed = initialSpeed,
        super(key: key);

  final bool _isStartPressed;
  final Function() _onFinish;
  final int _kInitialSpeed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: _isStartPressed,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.black87,
        padding: padding16,
        //TODO wrap this in a column and add know it logo somewhere
        child: Column(
          children: [
            Image.asset(
              knowItFull,
              height: 80,
            ),
            const VerticalSpace(of: spacing16),
            Expanded(
              child: Center(
                child: Wrap(
                  children: [
                    SizedBox(
                      width: 250.0,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 150.0,
                          color: knowItWhite,
                          fontFamily: 'GoogleSans',
                        ),
                        child: AnimatedTextKit(
                          // totalRepeatCount: 1,
                          isRepeatingAnimation: false,
                          pause: const Duration(milliseconds: 0),
                          onFinished: _onFinish,
                          animatedTexts: [
                            RotateAnimatedText(
                              '3',
                              transitionHeight: 100 * 2.5,
                              textStyle: const TextStyle(
                                color: knowItWhite,
                              ),
                              duration: Duration(milliseconds: _kInitialSpeed),
                            ),
                            RotateAnimatedText(
                              '2',
                              transitionHeight: 100 * 2.5,
                              textStyle: const TextStyle(
                                color: knowItWhite,
                              ),
                              duration: Duration(milliseconds: _kInitialSpeed),
                            ),
                            RotateAnimatedText(
                              '1',
                              transitionHeight: 100 * 2.5,
                              textStyle: const TextStyle(
                                color: knowItWhite,
                              ),
                              duration: Duration(milliseconds: _kInitialSpeed),
                            ),
                            RotateAnimatedText(
                              'GO!',
                              textStyle: const TextStyle(
                                fontSize: 120.0,
                                color: knowItWhite,
                              ),
                              transitionHeight: 120 * 2.5,
                              duration: Duration(milliseconds: _kInitialSpeed),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
