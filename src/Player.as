package {

import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.graphics.*;
import net.flashpunk.debug.*;

public class Player extends Entity {
	public var vel:vec = new vec(0,0);
	public var airborne:Boolean = true;

	public function Player () {
		x = 20; y = 20;

		graphic = new Text("hi", 0, 0);
		width = (graphic as Text).width;
		height = (graphic as Text).height;
		//(graphic as Text).centerOrigin();
		type = "player";

		FP.console.log("hi2");
	}

	override public function update ():void {
		FP.console.log("hi4");
		var a:vec = new vec(0,0);

                if (Input.check(Key.RIGHT))
                        a.x++;
                if (Input.check(Key.LEFT))
                        a.x--;
		vel.setadd(a);

		doJumping();
		doGravity();
		doFriction();

		var leftWall:Number = (FP.world as Game).leftWall(x, y);
		var rightWall:Number = (FP.world as Game).rightWall(x, y);

		moveBy(vel.x, vel.y, "platform", true);

		if (collide("platform", x, y+1)) {
			vel.y = 0;
			airborne = false;
		}
		else
			airborne = true;

		var sign:int = (vel.x == 0 ? 0 : vel.x > 0 ? 1 : -1);
		if (collide("platform", x + sign, y))
			vel.x = 0;
		FP.console.log("hi5");
	}

	public var jumpstate:int = 0;
	public function doJumping () : void {
		if (!airborne)
			jumpstate = 0;

		var canjump:* = jumpstate <= 5;

		if (Input.check(Key.SPACE) && canjump) {
			vel.y -= (airborne ? 1 : 5);
			jumpstate++;
		}
	}

	public function doGravity () : void {
		vel.y += 0.5;
	}

	public function doFriction () : void {
		vel.x *= 0.9;
	}
}
}
