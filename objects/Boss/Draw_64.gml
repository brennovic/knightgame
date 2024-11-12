if (mostrar_barra = true) {
    var barra_largura = 200; // Largura da barra de vida
    var barra_altura = 20;   // Altura da barra de vida
    var margem_x = 300;       // Posição X da barra na tela
    var margem_y = 20;       // Posição Y da barra na tela
    
    var hp_percentual = hp / hp_max; // Calcula o percentual de vida
    
    // Desenha o fundo da barra
    draw_rectangle(margem_x, margem_y, margem_x + barra_largura, margem_y + barra_altura, false);
    
    // Desenha a barra de vida preenchida com base no percentual
    draw_rectangle_color(
        margem_x, margem_y,
        margem_x + (barra_largura * hp_percentual), margem_y + barra_altura,
        c_red, c_red, c_red, c_red,
        false
    );
    
    // Opcional: Texto de Vida
    draw_text(margem_x + barra_largura / 2, margem_y + barra_altura / 2, string(hp) + "/" + string(hp_max));
}
