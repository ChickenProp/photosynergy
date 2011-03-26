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

		graphic = new Text("hi", 20, 20);
		type = "player";

		FP.console.log("hi2");
	}

	override public function update ():void {
		var a:vec = new vec(0,0);

                if (Input.check(Key.RIGHT))
                        a.x++;
                if (Input.check(Key.LEFT))
                        a.x--;
		vel.setadd(a);

		doJumping();
		doGravity();
		doFriction();

		x += vel.x;
		y += vel.y;

		if (y >= 300) {
			y = 300;
			vel.y = Math.min(vel.y, 0);
			airborne = false;
		}
		else
			airborne = true;
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
