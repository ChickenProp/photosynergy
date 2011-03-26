package {

import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.graphics.*;
import net.flashpunk.debug.*;

public class Platform extends Entity {
	public function Platform (_x:Number, _y:Number, _w:Number, _h:Number) {
		x = _x;
		y = _y;
		width = _w;
		height = _h;

		type = "platform";

		graphic = Image.createRect(width, height, 0xFF0000);
	}
}
}
