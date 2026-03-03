#region vars
//textos do meu menu
menu = ["Jogar", "Tutorial", "Sair"]

//indice que me diz em que opção estou no menu
atual = 0;

//varivael pra margem
margem = 40;

#endregion

#region metodos

function controla_menu()
{
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
	
	//se o player apertou enter
	if (keyboard_check_pressed(vk_enter))
	{
		ativa_menu();
	}
}

//metodo pra desenhar o menu
function desenha_menu()
{
	//pegando as dimensões da tela
	var _gui_height = display_get_gui_height();

	//alinhando o texto verticalmente
	draw_set_valign(1);



	//definindo a fonte
	draw_set_font(fnt_menu);

	//pegando a altura da fonte
	var _altura = string_height("I");

	//variavel para margem
	var _marg = 0;

	//laço for pra desenhar os textos
	for (var i = 0; i < array_length(menu); i++)
	{
		//var pra cor da opção
		var _cor = c_white;
	
		if (i == atual)
		{
			_cor = c_red;
		
			_marg = margem;
		}
		else
		{
			_marg = 0;
		}
	
		//mudando a cor
		draw_set_colour(_cor);
		//desenhando no meio da tela
		//somo o x com a marg
		//se for o atual, ele vai um pouco pra direita
		draw_text(20 + _marg, (_gui_height / 2) + i * _altura -50, menu[i]);
	}


	//resetando os draw sets
	draw_set_valign(0);

	//resentando a cor
	draw_set_colour(-1);

	//resetando a fonte 
	draw_set_font(-1);


}

ativa_menu = function()
{
	switch(atual)
	{
		//jogar
		case 0:
		{
		
		}
		
		break;
		
		//tutorial
		case 1:
		{
		
		}
		
		break;
		
		//sair
		case 2:
		{
			//saio do jogo
			game_end();
		}
		
		break
	}
}
#endregion