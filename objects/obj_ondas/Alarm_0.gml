//criando as sequencias
layer_sequence_create("seq_inimigos", 0, 0, ondas[indice]);



//se a minha array chegou no fim
if (indice < array_length(ondas) - 1)
{
	//adicionando 1 ao meu indice
	indice++;
	
	//chamando o alarme novamente depois de 300 frames
	alarm[0] = 330;
}