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

		moveBy(vel.x, vel.y, "platform", true);

		var e:Entity = collide("platform", x, y+1);
		if (e && (!(e is ThinPlatform) || bottom <= e.top)) {
			vel.y = 0;
			airborne = false;
		}
		else
			airborne = true;

		var sign:int = (vel.x == 0 ? 0 : vel.x > 0 ? 1 : -1);
		e = collide("platform", x + sign, y);
		if (e && !(e is ThinPlatform))
			vel.x = 0;
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

	override public function moveCollideY(e:Entity) : Boolean {
		// Don't hit thin platforms from below.
		if (e is ThinPlatform && vel.y < 0)
			return false;

		// But fall back through them if we didn't get all the way.
		if (e is ThinPlatform && bottom > e.top)
			return false;

		return true;
	}

	override public function moveCollideX(e:Entity) : Boolean {
		return !(e is ThinPlatform);
	}
}
}
