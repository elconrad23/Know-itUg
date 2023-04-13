import 'dart:math';

import '../../knowit_exporter.dart';

final spinIndexProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

/// selected color provider based on index of the spin wheel
final selectedSpinColorProvider = StateProvider<Color>(
  (ref) {
    final wheelColors = ref.watch(wheelColorsProvider);
    final selectedColorIndex = ref.watch(spinIndexProvider);

    return wheelColors[selectedColorIndex];
  },
);

// show game tile
final showGameTileProvider = StateProvider<bool>(
  (ref) {
    return true;
  },
);

// wheel colors
final wheelColorsProvider = Provider<List<Color>>(
  (ref) {
    return const [
      knowItColor,
      knowItOrange,
      knowItBlack,
      Color(0xFFFF0000),
      knowItTeal,
      Color(0xFFF8074B),
      Color(0xFFFF6F00),
      Color(0xFF90A4AE),
      Color(0xFFE65100),
      Color(0xFF800000),
    ];
  },
);

// set the currently selected SRHInfo Item
final srhInfoProvider = StateProvider<SRHInfo>((ref) {
  // empty item
  return SRHInfo(title: "", description: "", category: "");
});

/// Function that randomly generates an item from the [srhInfoList]
SRHInfo getRandomSrhListItem() {
  // random index
  final itemIndex = Random().nextInt(srhInfoList.length);

  // random item
  return srhInfoList[itemIndex];
}
