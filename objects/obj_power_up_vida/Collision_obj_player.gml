//minha instancia é destruida
instance_destroy();

if (other.vidas < 3)
{
	//e ganho vida
	other.vidas++;
}

//criando a particula do tiro
var _part = instance_create_layer(x, y, "tiro", obj_particula_tiro);

//personalizando a part
_part.image_angle = random(359);

//para de tocar o som do power up, pra evitar que um som toque por cima do outro
audio_stop_sound(sfx_powerup_on);

//tocando o som quando o player pegar o power up
audio_play_sound(sfx_powerup_on, 1, 0);