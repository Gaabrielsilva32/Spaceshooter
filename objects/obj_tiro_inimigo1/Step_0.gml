//se o meu tiro sair da tela
if (y >= 544) 
{
	//se destrua
	instance_destroy();
	
	//debug
	//show_debug_message("a")
}

//dando vel pro tiro
y += velv_tiro;