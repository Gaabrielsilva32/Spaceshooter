//minha instancia é destruida
instance_destroy();

//e ganho level de tiro
other.ganha_level_tiro();

//criando a particula do tiro
var _part = instance_create_layer(x, y, "tiro", obj_particula_tiro);

//personalizando a part
_part.image_angle = random(359);