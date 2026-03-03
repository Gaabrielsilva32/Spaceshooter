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

