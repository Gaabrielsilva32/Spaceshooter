if (global.hitstop) exit;

vida_atual--;

//fazendo ficar trasparente com o tempo
image_alpha = vida_atual / vida_max;


//diminuindo gradualmete em 4%
velh *= 0.96;
velv *= 0.96;

//ela some se está invisivel
if (vida_atual <= 0) instance_destroy();

x += velh;
y += velv;
