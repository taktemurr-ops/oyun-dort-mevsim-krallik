import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dort_mevsim_krallik/oyun_dort_mevsim_krallik.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dortMevsimKrallikConfig.title.length, 33);
    expect(dortMevsimKrallikConfig.tagline.length, 33);
    for (final s in dortMevsimKrallikConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dortMevsimKrallikConfig.gameId, dortMevsimKrallikId);
    expect(dortMevsimKrallikRules.gameId, dortMevsimKrallikId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dortMevsimKrallikRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dortMevsimKrallikId, optionalMechanics: dortMevsimKrallikRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dortMevsimKrallikRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
