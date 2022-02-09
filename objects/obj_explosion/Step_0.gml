percentage += 1 / 60;
if (percentage >= 1) instance_destroy();
crv_value = animcurve_channel_evaluate(curve, percentage);