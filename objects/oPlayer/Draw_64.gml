draw_sprite_ext(_11, 0, 1250, 5, -3, 3, 0, c_white, 1);
draw_set_font(Font1)
draw_set_color(c_black)
draw_text(1110, 30, "Pontos: " + string(score));

if (timer_active) {
	draw_set_color(c_black)
	draw_set_font(Font1)
    // Exibe o tempo em segundos, arredondado para um número inteiro
    draw_text(1110, 60, "Tempo: " + string(floor(time_elapsed)) + " s");
}
// Se a janela de pontuação final estiver ativada, exibe-a no centro da tela
if (show_score_window) {
   
   
   draw_sprite_ext(SpriteSheet_1,1,430,130,2,2,0,c_white,1)
    draw_set_color(c_black);
     draw_set_font(Font1)
    draw_text_transformed(530 ,230 , "Pontos Finais: " + string(score),2,2,0);
    draw_text_transformed(530, 290, "Tempo Final: " + string(floor(time_elapsed)) + " s",2,2,0);

    draw_text_transformed(500, 390, "Aperte R para voltar",2,2,0);
	timer_active = false
	
}


if (dialogo_ativo) {
    var largura = 1000;
    var altura = 100;
    var x_caixa = (display_get_width() - largura) / 2;
    var y_caixa = (display_get_height() - altura) - 50;
	
draw_sprite_ext(Mestre, 1, 250, 550, 1, 1, 0, c_white, 1);
    // Desenha a caixa de fundo do diálogo
   // draw_set_color(rgb(255, 0, 0));
    //draw_rectangle(x_caixa, y_caixa, x_caixa + largura, y_caixa + altura, false);
	 draw_sprite_ext(SpriteSheet,1,150, 550, 2.3, 2, 0,c_white,1);
draw_set_font(Font1)
    draw_set_color(c_black);
    draw_text(x_caixa + 20, y_caixa + 20, mensagens_dialogo[indice_dialogo]); // Exibe a mensagem atual
}






