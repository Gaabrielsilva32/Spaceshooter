//para a musica
audio_stop_all();


//se a var transicao for verdadeira
if (global.transicao)
{
	//crio a transição 2
	layer_sequence_create("sq_transicao", room_width / 2, room_height / 2, "sq_transicao2")
}