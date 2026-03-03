//quando eu apertar setinha pra baixo, eu desço no menu
if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")))
{
	//subo o indice, logo desço no menu
	atual++;
	
	//toco um som
	efeito_som(sfx_zap);
	
	//toda vez que eu trocar de opção
	//a margem vai pra 0
	margem = 0;
}

//quando eu apertar setinha pra cima, subo no menu
if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")))
{
	//desço o indice, logo subo no menu
	atual--;
	
	//toco um som
	efeito_som(sfx_zap);
	
	//toda vez que eu trocar de opção
	//a margem vai pra 0
	margem = 0;
}

//limitando o movimento do menu
// o indice não pode ser menor que 0 ou maior que 2
atual = clamp(atual, 0, array_length(menu) - 1);

//fazendo a margem sair de 0 até 40
margem = lerp(margem, 40, 0.1)