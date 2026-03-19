
//desenhando o level do player se 
//o global.debug for verdadeiro
if (global.debug)
{
	draw_text(20, 20, "Level do tiro: " + string(level_tiro));
}

if (global.transicao) exit;

//essa var vai pegar altura da minha viewport
var _gui_height = display_get_gui_height();

//criando uma var x pro icone
var _x_icone = 30;

//método de desenhar os icones
//desenhando os escudos
desenha_icone(spr_gui_escudo, escudos, _x_icone, _gui_height - 90);

//desenhando as vidas
desenha_icone(spr_gui_vida, vidas, _x_icone, _gui_height - 40);