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

	public function Light () {
		x = 20;
		y = 100;

		var image:* = new Image(LIGHT);
		image.alpha = 0.7;
		image.originX = 25;
		image.originY = 57;
		image.angle = -30;
		graphic = image;

		shadow.blend = "erase";

		renderTarget = target;
	}

	override public function update () : void {
		(graphic as Image).angle -= 0.1;
		originY += 0;
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

		if (dx > 0) {
			var height:Number = p.height;
			var width:Number = dx / dy * height;

			shadow.scaleX = width/100;
			shadow.scaleY = height/100;

			shadow.render(target, new Point(p.right, p.top), FP.camera);
		}
	}
}
}
