//chama a part do tiro
instance_create_layer(x, y, "particulas", obj_particula_tiro);

//se o tiro não saiu da room
if (y > 0)
{
	efeito_som(sfx_dano, .5);
}