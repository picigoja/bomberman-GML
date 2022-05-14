camera_window_x_ratio = camera_get_view_width(view_camera[view_current]) / window_get_width();
camera_window_y_ratio = camera_get_view_height(view_camera[view_current]) / window_get_height();

sidepanel_x = window_get_width() - 206 / camera_window_x_ratio;
sidepanel_y = 0;