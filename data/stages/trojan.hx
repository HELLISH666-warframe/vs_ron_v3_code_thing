function postCreate() {
	
	bruj.visible = false;
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
                    sky.visible = false;
                    mountainsback.visible = false;
                    mountains.visible = false;
                    hillfront.visible = false;
                    gradient.visible = false;
                    street.visible = false;
                    streetnolight.visible = false;
                
                 bruj.visible = true;
                 platform.visible = true;
                 atelo_popup_animated.visible = true;
                 error.visible = true;
        
            }
        }