if (dialogo_ativo) {
    var largura = 1000;
    var altura = 100;
    var x_caixa = (display_get_width() - largura) / 2;
    var y_caixa = (display_get_height() - altura) - 50;
	
draw_sprite_ext(Mestre, 0, 200, 590, 1.5, 1.5, 0, c_white, 1);
    // Desenha a caixa de fundo do diálogo
   // draw_set_color(rgb(255, 0, 0));
    //draw_rectangle(x_caixa, y_caixa, x_caixa + largura, y_caixa + altura, false);
	 draw_sprite_ext(SpriteSheet,1,150, 550, 2.3, 2, 0,c_white,1);
draw_set_font(Font1)
    draw_set_color(c_black);
    draw_text(x_caixa + 20, y_caixa + 20, dialogos[dialogo_atual]); // Exibe o texto do diálogo atual
}
