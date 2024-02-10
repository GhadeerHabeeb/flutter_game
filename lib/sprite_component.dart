import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_game/main.dart';

class Rock extends SpriteComponent with HasGameRef<MyGame>,CollisionCallbacks{
  Rock():super(){debugMode=true;}
  final rand=Random();
  @override
  Future<void> onLoad() async {
    await super.onLoad();

     sprite=await gameRef.loadSprite('rock.png');
     final yPosition=rand.nextDouble()*game.size.y;
     size=Vector2(100,100);
     position=Vector2(gameRef.size.x*0.95,yPosition);
    add( RectangleHitbox());
  }
 @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
   gameRef.gameOver=true;
   removeFromParent();
    super.onCollision(intersectionPoints, other);
  }
  @override
  void update(double dt) {
    super.update(dt);
    x=x-100*dt;

  }
}