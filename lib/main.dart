import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_game/Screens/game_over_Screen.dart';
import 'package:flutter_game/Screens/game_play_screen.dart';
import 'package:flutter_game/Screens/start_screen.dart';
import 'package:flutter_game/assets.dart';
import 'package:flutter_game/config.dart';
import 'package:flutter_game/crow.dart';
import 'package:flutter_game/sprite_component.dart';

  main() {
    WidgetsFlutterBinding.ensureInitialized();
    final myGame = MyGame();
    runApp(
      GameWidget(
        game: myGame,
      ),
    );
  }


  class MyGame extends FlameGame with HasCollisionDetection{
    late final RouterComponent router;
    bool gameOver=false;
    bool isShowGameOver=false;
    String chara='';
    Vector2 gravity=Vector2(0, 30);
    Crow crow=Crow();
    @override
  void onLoad()async {
      super.onLoad();
      add(router=RouterComponent(initialRoute:'start' ,
          routes: {
            'start': Route(StartScreen.new),
        'gameplay': Route(GameScreen.new),
            'gameover': Route(GameOverScreen.new),
      }));
    }
@override
  void update(double dt) {
    super.update(dt);
    if(gameOver&&!isShowGameOver)
      {
        router.pushNamed('gameover');
        isShowGameOver=true;
      }
  }


  }




class PlayArea extends RectangleComponent with HasGameReference<MyGame> {
  PlayArea()
      : super(
    paint: Paint()..color = const Color(0xffaaf890),
    children: [RectangleHitbox()],
  );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.size.x, game.size.y);
  }
}





/*
final Random rand=Random();
class MyCrate extends RectangleComponent with HasGameRef<MyGame>{
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyCrate() : super(
    paint: Paint()..color=Colors.deepPurple,

  );

  Future<void> onLoad() async {
    size = Vector2(game.size.x, game.size.y);
  }

}
class Background extends SpriteComponent  with HasGameRef<MyGame>{
  Background();

  @override
  FutureOr<void> onLoad() async {
    final background=await Flame.images.load('background.png');
    sprite= Sprite(background);
    size = Vector2(game.size.x/2, game.size.y/2);
    return onLoad();
  }
}

class MyGame extends FlameGame with HasCollisionDetection {
  late Brick ball;
  final _random=Random();
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(MyCrate());
    add(Charactor());


    addAll([                            // Drop the await
      for (var i = 0; i < ballColors.length; i++)
        for (var j = 1; j <= 2; j++)
          Brick(
            Vector2(
              ( i + 100* _random.nextDouble()) *5 + (i + 1) * brickGutter,
              (j+ 100* _random.nextDouble())*2+ j * brickGutter*_random.nextDouble(),
            ),
            ballColors[i],


          ),

    ]);

  }
}
class Charactor extends SpriteComponent with DragCallbacks, HasGameRef<MyGame>,CollisionCallbacks{
  Charactor():super(
    children: [CircleHitbox()],
  );
  @override
  Future<void> onLoad() async{
    final charactor=await Flame.images.load('char.png');
    size=Vector2(60, 60);
    position=Vector2(220, 550);
    sprite=Sprite(charactor);

  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.x = (position.x + event.localDelta.x);


  }
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    print('collision');
  }


}


class Brick extends CircleComponent
    with  HasGameReference<MyGame>,CollisionCallbacks {
  Brick(Vector2 position, Color color)
      : super(
    position: position,
    radius: 10,
    anchor: Anchor.center,
    paint: Paint()
      ..color = color
      ..style = PaintingStyle.fill,

children:[CircleHitbox()],
  );

  @override
  Future<void> onLoad() {
    // TODO: implement onLoad

    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position.y += Config.birdVeolcity * dt;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
   position.y=0;
    position.x+= rand.nextDouble()*300;

  }

}
*/
