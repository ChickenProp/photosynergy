package {

import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.debug.*;

public class Photosynergy extends Engine {
        public function Photosynergy() {
                super(640, 480, 60, false);
                Data.load("photosynergy-data");

                FP.console.enable();
                FP.world = new Game;
        }
}
}
