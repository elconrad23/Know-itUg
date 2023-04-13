import '../../knowit_exporter.dart';
import 'components/game_selected_tile.dart';
import 'components/game_tip.dart';
import 'components/game_wheel.dart';

class KnowItSpinWheel extends ConsumerWidget {
  const KnowItSpinWheel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: padding16,
        child: Column(
          children: const [
            //Small tip
            GameTip(),

            // text
            VerticalSpace(of: spacing8),
            Expanded(child: Center(child: GameWheel())),
            VerticalSpace(of: spacing8),

            // game selected
            GameSelectedTile(),

            VerticalSpace(of: spacing16),
          ],
        ),
      ),
    );
  }
}
