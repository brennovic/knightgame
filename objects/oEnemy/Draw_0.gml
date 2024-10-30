// Desenha o sprite do inimigo
draw_self();

// Desenha a barra de vida acima do inimigo
var largura_barra = 32;   // Largura da barra
var altura_barra = 4;     // Altura da barra

// Calcula a porcentagem de vida atual
var porcentagem_vida = vida / vida_maxima;

// Define a posição da barra acima do inimigo
var x_barra = x - largura_barra / 2;
var y_barra = y - sprite_height / 2 - 10;

// Desenha a barra de fundo (vermelho)
draw_set_color(c_red);
draw_rectangle(x_barra, y_barra, x_barra + largura_barra, y_barra + altura_barra, false);

// Desenha a vida atual (verde)
draw_set_color(c_orange);
draw_rectangle(x_barra, y_barra, x_barra + (largura_barra * porcentagem_vida), y_barra + altura_barra, false);





