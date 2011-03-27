package {

import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.debug.*;

public class Game extends World {
	public var player:Player = null;

	public var platform:Platform = new Platform(150, 250, 50, 50);

	public function Game () {
		FP.console.log("hi");
		player = new Player;
		add(player);
		add(new Light(40, 100, -30, -0.1));
		add(new Light(300, 100, -150, 0.1));
		add(new Platform(0, 300, 640, 180));
		add(new ThinPlatform(250, 200, 100, 10));
		add(platform);
	}
}
}
