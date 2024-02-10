import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_game/main.dart';

class Crow extends SpriteAnimationComponent with HasGameRef<MyGame>,CollisionCallbacks{
Crow():super(){debugMode=true;}
  @override
  void onLoad()async {
    await super.onLoad();
    final crowAnimation=await gameRef.loadSpriteAnimation(
        gameRef.chara,
        SpriteAnimationData.sequenced(
            amount:  gameRef.chara=='bird.png'? 9:12,
            amountPerRow:  gameRef.chara=='bird.png'? 3:4,
            stepTime: 0.1,
            textureSize:   gameRef.chara=='bird.png'?Vector2(350,300):Vector2(700,800),
        /*crow  textureSize: Vector2(700,800),*/

        ));



    animation=crowAnimation;
    position=gameRef.size/2;
    anchor= Anchor.center;
    size=  gameRef.chara=='bird.png'?Vector2(250,250):Vector2(250, 250);

  add(CircleHitbox());
  }
  @override
  void update(double dt) {
    if(y<gameRef.size.y&&y>0) {
      gameRef.gravity.y+=.4;
      position += gameRef.gravity * dt;
    }
    else if(!gameRef.isShowGameOver)
    {
      gameRef.gameOver=true;

    }
    super.update(dt);
  }

}