//Andar
if place_meeting(x,y,obj_chao){
	x += 0;
	y += 0;
}
else{
	if keyboard_check(vk_right){
		x += spd;
	}
	if keyboard_check(vk_left){
		x -= spd;
	}
}

//Gravidade
if place_meeting(x,y+1,obj_chao){
	vspeed=-0;
	
	//Pular
	if keyboard_check(vk_up){
	vspeed=-3
	}
}
else{
	vspeed += 0.15;
}