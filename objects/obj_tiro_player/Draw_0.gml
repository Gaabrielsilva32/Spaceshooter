//me desenhando
draw_self();

//mudando a forma como o pc mistura as cores
gpu_set_blendmode(bm_add);

//desenhando o tiro novamente sobre o meu
//meio trasparente
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 1.3, image_yscale * 1.3, image_angle, image_blend, 0.5);

//resetando a forma como o pc mistura as cores
gpu_set_blendmode(bm_normal);