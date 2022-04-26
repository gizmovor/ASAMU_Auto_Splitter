state("ASAMU-Win32-Shipping") {
	int loading : "ASAMU-Win32-Shipping.exe", 0x270C674;
	int story_state : "ASAMU-Win32-Shipping.exe", 0x26D22C0, 0x40;
	int zone : "ASAMU-Win32-Shipping.exe", 0x270C604;
	int load_counter : "ASAMU-Win32-Shipping.exe", 0x270AA14;
}

start {
  	return ((current.zone == 115) && (old.zone == 119));
}

split {
	return ((current.load_counter != old.load_counter) 
	&& (old.zone != 119) && (old.zone != 43) && (old.zone != 15) && (old.zone !=13) && (old.zone !=99) && (old.zone !=7))        //check that the player didn't quit out and continue during a level
	|| ((current.story_state != old.story_state) && (current.story_state == 1032));												//final split of the game
}

isLoading {
	return current.loading == 1;
}

/////levels code///////
// prologue and main menu : 4
// sanctuary : 115
// village : 39
// chasms : 11
// star haven : 9
// ice caves : 95
// epilogue : 3

// the code of loadings is the sum of the current level code and the next level code

//return ((current.load_counter != old.load_counter) && (current.zone != old.zone))
//	|| ((current.story_state != old.story_state) && (current.story_state == 1032));

// start at 1:39.29 if starting when in sanc.