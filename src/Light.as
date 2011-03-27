package {

import flash.display.BitmapData;
import flash.geom.Point;
import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.graphics.*;
import net.flashpunk.debug.*;

public class Light extends Entity {
	[Embed(source = '../media/light-beam.png')]
	private const LIGHT:Class;
	[Embed(source = '../media/shadow.png')]
	private const SHADOW:Class;

	public var target:BitmapData = new BitmapData(640, 480);
	public var shadow:Image = new Image(SHADOW);

	public var speed:Number = 0;
	public function Light (_x:Number, _y:Number, _a:Number, _s:Number) {
		x = _x;
		y = _y;
		speed = _s

		var image:* = new Image(LIGHT);
		image.alpha = 0.7;
		image.originX = 10;
		image.originY = 57;
		image.angle = _a;
		graphic = image;

		shadow.blend = "erase";

		renderTarget = target;
	}

	override public function update () : void {
		(graphic as Image).angle += speed;
	}

	override public function render () : void {
		target.fillRect(target.rect, 0x00000000);

		super.render();

		castShadow((FP.world as Game).platform);

		FP.buffer.draw(target, null, null, "normal");
	}

	public function castShadow(p:Platform) : void {
		// for now, assume the platform is below the light (dy > 0).
		var dx:Number = p.right - x;
		var dy:Number = p.top - y;

		if (dx > 0)
			drawShadow(p.right, p.top, dx/dy*p.height, p.height);

		dx = p.left - x;
		if (dx < 0)
			drawShadow(p.left, p.top, dx/dy*p.height, p.height);
	}

	// To flip the shadow, just make width or height negative.
	public function drawShadow(x:Number, y:Number, w:Number, h:Number)
	: void {
		shadow.scaleX = w/100;
		shadow.scaleY = h/100;

		shadow.render(target, new Point(x, y), FP.camera);
	}

}
}
