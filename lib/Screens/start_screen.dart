
import 'dart:ui' hide TextStyle;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flutter_game/main.dart';
import 'package:flutter_game/select_bird.dart';

class StartScreen extends SpriteComponent with HasGameRef<MyGame>,TapCallbacks
{
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite=await gameRef.loadSprite('background_glacial_mountains.png');
    size=gameRef.size;
    add(TextComponent(
      position: Vector2(gameRef.size.x/8,y),
        text: 'Select Your Character',
        textRenderer: TextPaint(style: TextStyle(fontSize: 45,color: Color(0xFFFF0059)))
    ));
    add(RectangleComponent(
      anchor: Anchor.center,
      position: gameRef.size/2,
      children: [TextComponent(
          text: 'Start',
          textRenderer: TextPaint(style: TextStyle(fontSize: 45,color: Color(0xFFFF0059)))
      )]
    ));

    add(SelectedBird1());
    add(SelectedBird2());

  }
  bool ContainLocalPoint(Vector2 point)=>true;
  @override
  void onTapUp(TapUpEvent event) {
  if(gameRef.chara=='')
    {
      gameRef.chara='crow.png';
    }
  gameRef.router.pushNamed('gameplay');
    super.onTapUp(event);
  }
}