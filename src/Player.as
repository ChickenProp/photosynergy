package {

import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.graphics.*;
import net.flashpunk.debug.*;
import flash.geom.Point;

public class Player extends Entity {
	public var vel:Point = new Point(0,0);

	public function get pos() : Point {
		return new Point(x, y);
	}
	public function set pos(p:Point) : void {
		x = p.x; y = p.y;
	}

	public function Player () {
		x = 20; y = 20;

		graphic = new Text("hi", 20, 20);
		type = "player";

		FP.console.log("hi2");
	}

	override public function update ():void {
		var a:Point = new Point(0,0);

                if (Input.check(Key.RIGHT))
                        a.x++;
                if (Input.check(Key.LEFT))
                        a.x--;
		
		vel = vel.add(a);
		pos = pos.add(vel);
	}
}
}
