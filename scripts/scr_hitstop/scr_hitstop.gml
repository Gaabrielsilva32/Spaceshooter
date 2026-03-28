//var de controle do hitstop
global.hitstop = false;

//metodo pra chamar o hitstop
function chama_hitstop(_tempo)
{
	//o hitstop fica true
	global.hitstop = true;
	
	//var que diz se o obj existe na room
	var _exist = instance_exists(obj_hitstop_maneger);
	
	//verificando se o obj está na room
	//se o obj não existir
	//eu crio ele
	//uso o depth, pois ele não precisa de uma layer especifica
	if (!_exist) instance_create_depth(0, 0, 0, obj_hitstop_maneger);
	
	//dizendo que o tempo que o hitstop terá
	obj_hitstop_maneger.timer_hitstop = _tempo;
}


//função para detectar/checar o background
function chama_background()
{
	//var para pegar todas as layers
	//ele as armazena numa array
	var _layers = layer_get_all();
	
	//var para pegar a largura da minha array
	var _qtd = array_length(_layers);
	
	//laço for
	//enquanto i (o indice, que começa do 0)
	//for menor que _qtd (a quantidade de itens dentro da lista, 
	// que começa a contar do 1)
	for (var i = 0; i <= _qtd; i++)
	{
		//pegando a layer atual
		var _atual = _layers[i];
		
		//pegando o id das camadas que tenham elemento de BACKGROUND	
		//Lembrando, que só as camadas de background podem ter elemento de background
		//as outras não podem ter.
		//o game maker lê todas as camadas, sem exceção
		//As que NÃO são de Background, ele retorna -1, porque é invalido.
		//As que SÃO de Background, ele retorna de 0 pra cima.
		//Ou seja, se uma camada for -1, ele não é de Background
		//Se for diferente de -1, ela é
		//Pra conseguir essa informação, uso a função abaixo
		var _id_bg = layer_background_get_id(_atual);
		
		//se for diferente de -1
		//ou seja, se for uma camada de Background
		if (_id_bg != -1)
		{
			
		}
		
		
	}
}