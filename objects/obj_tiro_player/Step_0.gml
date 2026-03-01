//fazendo o tiro ser destruído após sair da tela
if (y <= -32)
{
	instance_destroy();
}
		
//diminuido o tamanho gradualmente com o lerp
image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = lerp(image_yscale, 1, 0.1);

//aumentando a vel do tiro gradualmente
vspeed = lerp(vspeed, -10, 0.1);