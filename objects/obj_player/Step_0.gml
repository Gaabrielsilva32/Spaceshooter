
//chamando a função de controle do player
controle_player();

//se eu soltar o tab
if (keyboard_check_released(vk_tab))
{
	//inverto o valor da global.debug
	global.debug = !global.debug;
}

//se eu apertar enter, perco vida
if (keyboard_check_pressed(vk_enter))
{
	perde_vida();
}




//se eu apertar "O" eu ganho level
if (keyboard_check_pressed(ord("O")))
{
	level_tiro++;
}
//se eu apertar "L" eu perco level
else if (keyboard_check_pressed(ord("L")))
{
	level_tiro--;
}

fim_ef_mola(0.3)

contador_ef_branco();

//debug 
//show_debug_message(timer_invenci)