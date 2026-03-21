//se o meu tiro sair da tela
if (y >= 544) 
{
	//se destrua
	instance_destroy();
	
	//debug
	//show_debug_message("a")
}

//dando vel vertical pro tiro
y += velv;

//dando vel horizontal pro tiro
x += velh