//Váriaveis
esquerda = keyboard_check(vk_left);
direita = keyboard_check(vk_right);
pular = keyboard_check(vk_up)
ataqueA = keyboard_check(vk_numpad1)
ataqueB = keyboard_check(vk_numpad2)
parado = keyboard_check(vk_nokey)

//Calc Velocidade - horizontal
move = -(esquerda)+(direita)
hsp = move*velocidade

// Colisão - Vertical - Estilo 1
if place_meeting(x+hsp,y,obj_chao){
	while !place_meeting(x+sign(hsp), y, obj_chao){
		x+=sign(hsp)
	}
	hsp=0
}

// Colisão - Gravidade - Estilo 2
if !place_meeting(x,y+1,obj_chao){
	velv += grav
}
else{
	//pulo
	if(pular){
	velv-=pulo
	sprite_index =spr_player_beta_dash_frente
	}
}
repeat(abs(velv)){
	if !place_meeting(x,y+sign(velv),obj_chao){
		y+=sign(velv)
	}
	else{
		velv=0
		break
	}
}

//Movimentação vertical - resultado
x+=hsp
//Sprites movimentação
//Horizontal
if (esquerda) or (direita)
{
    if (sign(move)!=0){
		sprite_index =spr_player_beta_walk;
		image_xscale = sign(move)
	}
	else{
		sprite_index = spr_player_beta_walk;
	}
}

//Ataque A
if(ataqueA) or (ataqueB){
	if(ataqueA){
		sprite_index = spr_player_beta_sword_atack;
		if place_meeting(x, y, obj_player_01)
			dano-=1;
	}
	if(ataqueB){
		sprite_index = spr_player_beta_dagger_atack1;
		if place_meeting(x, y, obj_player_01)
			dano-=1;
	}	
	if(dano<0){
		stack -= 1;
	}
}

if (parado){
	sprite_index = spr_player_beta_idle
}
//Red Winshg
if(stack = 0){
	instance_destroy(obj_player_01)
	instance_destroy(obj_player_02)
	room_goto(room_arena_redwins)
}