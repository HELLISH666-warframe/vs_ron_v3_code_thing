function postCreate() {
	
	platform.visible = false;
	atelo_popup_animated.visible = false;
	error.visible = false;
}
function stepHit(step)
        {
            switch (step)
            {
                //stage 2
                case 384:
                    sky.destroy();
                    mountainsback.destroy();
                    mountains.destroy();
                    hillfront.destroy();
                    street.destroy();
                
                 platform.visible = true;
                 atelo_popup_animated.visible = true;
                 error.visible = true;
        
            }
        }