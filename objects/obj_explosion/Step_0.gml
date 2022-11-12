percentage += 1 / 25;
if (percentage > EXPLOSION_EFFECT_TRESHOLD) instance_destroy();
crv_value = animcurve_channel_evaluate(curve, percentage);