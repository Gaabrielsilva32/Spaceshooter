



//se o hitstop existe, saio do evento
if (global.hitstop) exit;

//diminuindo a opacidade dele com o tempo
image_alpha -= .1;


//diminuindo ele de tamanho com o tempo
image_xscale -= .1;
image_yscale -= .1;


//impedindo que o tiro fique negativo
//o valor minimo é 0
clamp(image_xscale, 0, image_xscale);
clamp(image_yscale, 0, image_yscale);


//ele some se a opacidade chaga a zero
if (image_alpha == 0 ) instance_destroy();