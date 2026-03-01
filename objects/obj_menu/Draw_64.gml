//pegando as dimensões da tela
var _gui_height = display_get_gui_height();

//alinhando o texto verticalmente
draw_set_valign(1);


//laço for pra desenhar os textos
for (var i = 0; i < array_length(menu); i++)
{
	//var pra cor da opção
	var _cor = c_white;
	
	if (i == atual)
	{
		_cor = c_red;
	}
	
	//mudando a cor
	draw_set_colour(_cor);
	//desenhando no meio da tela
	draw_text(20, (_gui_height / 2) + i * 20, menu[i]);
}


//resetando os draw sets
draw_set_valign(0);

draw_set_colour(-1);