
//chamando a função de controle do player
controle_player();



fim_ef_mola(0.3)

contador_ef_branco();

//debug 
if (keyboard_check_pressed(vk_tab))
{
	vidas--;
}