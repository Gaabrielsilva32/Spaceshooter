//mudando a forma como o pc mistura as cores
gpu_set_blendmode(bm_add);

//desenhando o tiro novamente sobre o meu
//meio trasparente
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, cor, image_alpha);

//resetando a forma como o pc mistura as cores
gpu_set_blendmode(bm_normal);