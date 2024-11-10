// Configuração da velocidade do cursor
var cursor_speed = 10;
var cursor_sensitivity = 5; 
var smoothing_factor = 3;  

// Verifica se o controle está conectado
if (gamepad_is_connected(0)) {
    
    var move_x = gamepad_axis_value(0, gp_axisrh) * cursor_speed;
    var move_y = gamepad_axis_value(0, gp_axisrv) * cursor_speed;

    x += move_x * smoothing_factor;
    y += move_y * smoothing_factor;

  
    x = clamp(x, 0, display_get_width());
    y = clamp(y, 0, display_get_height());

  
    display_mouse_set(x, y);

   
    mouse_visible = false;
} else {
   
    mouse_visible = true;
}