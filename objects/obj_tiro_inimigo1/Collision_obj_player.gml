//debug
//show_debug_message("a")

//o tiro se destroi
instance_destroy();

//a particula é criada
instance_create_layer(x, y, "tiro", obj_particula_tiro);

if (obj_player.meu_escudo = noone)
{
	obj_player.perde_vida();
}
else
{
	return;
}