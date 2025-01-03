function postCreate() {
    forceCenterX = false; 
    for (i=>button in menuItems.members) {
        button.x += Math.sin(i) * 300; // move buttons
    }
}