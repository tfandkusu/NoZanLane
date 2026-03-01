import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_ui_model.dart';

const _introductionText = '''
はじめまして。プロフィールをご覧いただきありがとうございます😊

都内でIT関連の会社に勤めています。
普段は落ち着いた環境で仕事をしていて、コツコツ取り組むタイプです。周りからは「真面目」「穏やか」と言われることが多いですが、仲良くなるとよく笑います。

休日はカフェ巡りや映画鑑賞、美術館に行くのが好きです。
季節を感じられる場所に出かけるのも好きで、春は桜、夏は海、秋は紅葉、冬はイルミネーションを見に行ったりしています。

旅行も好きで、国内外問わずいろいろな街を歩くのが楽しみです。
観光地を回るのも好きですが、その土地のスーパーや市場に行ってみるのも好きです。

家でゆっくり過ごす時間も大切にしていて、読書をしたり、料理をしたり、ドラマをまとめて観たりしています。最近は自炊を頑張っていて、和食を練習中です。

お互いを思いやれて、自然体でいられる関係が理想です。
一緒に美味しいものを食べたり、何気ない日常を楽しめるような方と出会えたら嬉しいです。

まずはメッセージから、ゆっくりお話できたらと思います。
どうぞよろしくお願いします🌷''';

/// MemberProfile 画面の固定状態を提供します。
final memberProfileUiModelProvider = Provider<MemberProfileUiModel>(
  (ref) => const MemberProfileUiModel(
    introductionText: _introductionText,
  ),
);
