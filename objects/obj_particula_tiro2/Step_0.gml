if (global.hitstop) exit;


//fazendo ficar trasparente com o tempo
image_alpha -= .06;



//diminuindo gradualmete em 4%
velh *= 0.96;
velv *= 0.96;

//ela some se está invisivel
if (image_alpha <= 0) instance_destroy();

x += velh;
y += velv;
