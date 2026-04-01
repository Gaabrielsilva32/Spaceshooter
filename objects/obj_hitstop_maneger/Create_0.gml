//timer do hitstop
//define quanto tempo o efeito durará
timer_hitstop = 0;


//detectando os backgrounds
var _teste = pega_backgrounds();

show_message(_teste);

//metodo para parar o efeito
function desfaz_hitstop()
{
	//se o efeito não esta ativo, não faço nada
	if (!global.hitstop) return;
	
	//if o efeito esta ativo
	if (global.hitstop)
	{
		//diminuo o timer gradualmente
		timer_hitstop--;
		
		//fazendo as animações pararem
		with(all)
		{
			image_speed = 0;
		}
		
		
		//se o timer chegar a zero
		if (timer_hitstop <= 0)
		{
			//desativo o efeito
			global.hitstop = false;
			
				//fazendo as animações voltarem
			with(all)
			{
				image_speed = 1;
			}
		}
	}
}