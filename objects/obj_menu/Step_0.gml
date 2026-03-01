//quando eu apertar setinha pra baixo, eu desço no menu
if (keyboard_check_pressed(vk_down))
{
	//subo o indice, logo desço no menu
	atual++;
}

//quando eu apertar setinha pra cima, subo no menu
if (keyboard_check_pressed(vk_up))
{
	//desço o indice, logo subo no menu
	atual--;
}

//limitando o movimento do menu
// o indice não pode ser menor que 0 ou maior que 2
atual = clamp(atual, 0, array_length(menu) - 1);