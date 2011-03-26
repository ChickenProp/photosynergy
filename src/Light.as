package {

import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.graphics.*;
import net.flashpunk.debug.*;

public class Light extends Entity {
	[Embed(source = '../media/light-beam.png')]
	private const LIGHT:Class;

	public function Light () {
		x = 20;
		y = 50;

		var image:* = new Image(LIGHT);
		image.alpha = 0.7;
		image.originX = 0;
		image.originY = 50;
		graphic = image;
	}

	override public function update () : void {
		(graphic as Image).angle -= 0.1;
	}
}
}