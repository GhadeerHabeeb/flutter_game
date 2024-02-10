import 'dart:html';
import 'dart:ui' hide TextStyle;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/text.dart';
import 'package:flutter_game/main.dart';

class GameOverScreen extends SpriteComponent with HasGameRef<MyGame>,TapCallbacks
{
   @override
  Future<void> onLoad() async {
   await super.onLoad();
  sprite=await gameRef.loadSprite('background_glacial_mountains.png');
   size=gameRef.size;
 add( TextComponent(
   text: 'GameOver',
   anchor: Anchor.center,
   position: gameRef.size/2,
   textRenderer: TextPaint(style: TextStyle(fontSize: 45,color: Color(0xFFFF0059)))
 ) );
  }
  bool ContainLocalPoint(Vector2 point)=>true;
 @override
  void onTapUp(TapUpEvent event) {
    gameRef.crow.position=gameRef.size/2;
    gameRef.isShowGameOver=false;
    gameRef.gameOver=false;
    gameRef.router.pop();
    super.onTapUp(event);
  }
}