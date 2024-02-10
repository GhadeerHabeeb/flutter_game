import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_game/main.dart';

class SelectedBird1 extends SpriteAnimationComponent with HasGameRef<MyGame>,TapCallbacks{
  SelectedBird1():super(){debugMode=true;}
  @override
  void onLoad()async {
    await super.onLoad();
    final crowAnimation=await gameRef.loadSpriteAnimation(
        'bird.png',
        SpriteAnimationData.sequenced(
          amount: 9,
          amountPerRow: 3,
          stepTime: 0.1,
          textureSize: Vector2(350,300),
          /*crow  textureSize: Vector2(700,800),*/

        ));



    animation=crowAnimation;
    position=/*Vector2(300, 200)*/gameRef.size/4;
    anchor= Anchor.center;
    size=Vector2(250,250);

  }
  @override
  void onTapUp(TapUpEvent event) {
print('bird');
   gameRef.chara='bird.png';
    super.onTapUp(event);
  }
  @override
  void update(double dt) {
    super.update(dt);
  }

}


class SelectedBird2 extends SpriteAnimationComponent with HasGameRef<MyGame>,TapCallbacks{
  SelectedBird2():super(){debugMode=true;}
  @override
  void onLoad()async {
    await super.onLoad();
    final crowAnimation=await gameRef.loadSpriteAnimation(
        'crow.png',
        SpriteAnimationData.sequenced(
          amount: 12,
          amountPerRow:4,
          stepTime: 0.1,
          textureSize: Vector2(700,800),
          /*crow  textureSize: Vector2(700,800),*/

        ));



    animation=crowAnimation;
    position=/*Vector2(800, 200)*/Vector2(gameRef.size.x-150, gameRef.size.y/4);
    anchor= Anchor.center;
    size=Vector2(250,250);

  }
  @override
  void onTapUp(TapUpEvent event) {
    print('crow');
    gameRef.chara='crow.png';
    super.onTapUp(event);
  }
  @override
  void update(double dt) {
    super.update(dt);
  }

}