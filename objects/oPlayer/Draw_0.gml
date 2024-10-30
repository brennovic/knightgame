draw_set_color(c_black); // Set the color of the trail

if (is_dashing) {
    array_push(dash_trail, [x, y]); // Store the position during dashing

    for (var i = 1; i < array_length(dash_trail); i++) { 
        var pos = dash_trail[i];
        var prev_pos = dash_trail[i - 1];
        
        // Draw a line with width between consecutive positions
        draw_line_width(prev_pos[0], prev_pos[1], pos[0], pos[1], 6);
    }
}


//var xscale = (xMove != 0) ? sign(xMove)  : image_xscale;

draw_sprite_ext(
    sprite_index,   
    image_index,    
    x,              
    y,              
    image_xscale,   
    1,             
    0,              
    c_white,        
    1               
);

