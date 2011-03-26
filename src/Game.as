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
}
}
