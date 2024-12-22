var lastElapsedTime = 0;

function update(elapsed) {
    lastElapsedTime += elapsed;
	while(lastElapsedTime >= 1/60) { //trying to run this in 60 fps by calculating the amount of frames it needs for a full frame in 60 fps	
        scripts.call('update60', [1 / 60]); //fake elapsed time
        lastElapsedTime -= 1/60;
    } 
}

var postlastElapsedTime = 0;

function postUpdate(elapsed) {
    postlastElapsedTime += elapsed;
	while(postlastElapsedTime >= 1/60) { //trying to run this in 60 fps by calculating the amount of frames it needs for a full frame in 60 fps	
        scripts.call('updatePost60', [1 / 60]); //fake elapsed time
        postlastElapsedTime -= 1/60;
    } 
}