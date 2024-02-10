import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_game/config.dart';
import 'package:flutter_game/crow.dart';
import 'package:flutter_game/main.dart';
import 'package:flutter_game/sprite_component.dart';

class GameScreen extends Component with HasGameRef<MyGame>,TapCallbacks{
  GameScreen();
  final _rand=Random();
  Timer interval =Timer(6,repeat: true);

@override
  Future<void> onLoad() async {
    await super.onLoad();

    ParallaxComponent mountainBg=await gameRef.loadParallaxComponent([
      ParallaxImageData('sky.png'),
      ParallaxImageData('clouds_bg.png'),
      ParallaxImageData('background_glacial_mountains.png'),
      ParallaxImageData('clouds_mg_1.png'),
      ParallaxImageData('cloud_lonely.png'),
    ],
        baseVelocity: Vector2(10, 0),
        velocityMultiplierDelta: Vector2(1.6, 1.0));



    add(mountainBg);
    add(gameRef.crow);
    interval.onTick=()=>add( Rock());

    add(UpButton());
    add(DownButton());
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }



  }

  class UpButton extends SpriteComponent with HasGameRef<MyGame>,TapCallbacks{
    UpButton();
    @override
  Future<void> onLoad() async {
      sprite=await gameRef.loadSprite('upButton.png');
      size=Vector2(100,100);
      position=Vector2(gameRef.size.x*.2,gameRef.size.y*.2);
  await super.onLoad();
  }
    bool ContainLocalPoint(Vector2 point)=>true;
    @override
    void onTapUp(TapUpEvent event) {
      super.onTapUp(event);
      gameRef.gravity.y-=20;
    }

  }

class DownButton extends SpriteComponent with HasGameRef<MyGame>,TapCallbacks{
  DownButton();
  @override
  Future<void> onLoad() async {
    sprite=await gameRef.loadSprite('downButton.png');
    size=Vector2(100,100);
    position=Vector2(gameRef.size.x*.2,gameRef.size.y*.6);
    await super.onLoad();
  }
  bool ContainLocalPoint(Vector2 point)=>true;
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    gameRef.gravity.y+=20;
  }

}


