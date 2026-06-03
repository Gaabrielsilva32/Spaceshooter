if (global.hitstop) exit;

vida_atual--;


//valor
var _val = vida_atual / vida_max;

//fazendo ficar trasparente com o tempo
image_alpha = _val;


//diminuindo gradualmete em 4%
velh = _val * velh_original;
velv = _val * velv_original;

//ela some se está invisivel
if (vida_atual <= 0) instance_destroy();

x += velh;
y += velv;
