draw_self();
draw_sprite(spr_ai, 0, x, y);
draw_set_color(c_red);
draw_circle(ai_target_x - 1, ai_target_y - 1, 3, true);
draw_set_color(c_white);