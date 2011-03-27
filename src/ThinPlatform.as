package {

import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.graphics.*;
import net.flashpunk.debug.*;

public class ThinPlatform extends Platform {
	public function ThinPlatform(_x:Number,_y:Number,_w:Number,_h:Number) {
		super(_x, _y, _w, _h);

		graphic = Image.createRect(width, height, 0x00FF00);
	}
}
}
