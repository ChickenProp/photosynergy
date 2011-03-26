package {

import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.debug.*;

public class Game extends World {
	public var player:Player = null;

	public function Game () {
		FP.console.log("hi");
		player = new Player;
		add(player);
		add(new Light);
		FP.console.log("hi3");
	}

	public function floor (x:Number, y:Number) : Number {
		if (150 <= x && x <= 200)
			return 250;
		return 300;
	}

	public function leftWall (x:Number, y:Number) : Number {
		if (y < 250)
			return 0;
		if (x <= 200)
			return 0;
		return 201;
	}

	public function rightWall (x:Number, y:Number) : Number {
		if (y < 250)
			return 640;
		if (x >= 150)
			return 640;
		return 149;
	}
}
}
