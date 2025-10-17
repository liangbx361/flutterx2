import 'dart:math';

class GameRepo {
  final _rand = Random();

  Future<List<String>> fetchHotGames() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 600));

    // 模拟 1/4 概率报错，用于演示错误态/重试
    if (_rand.nextInt(4) == 0) {
      throw Exception('Network shaky, please retry');
    }
    return ['Genshin', 'PUBG', 'Lost Ark', 'MapleStory'];
  }
}
