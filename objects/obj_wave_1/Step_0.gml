// Define o número máximo de inimigos permitidos
var max_inimigos = 4;

// Conta quantas instâncias de oEnemy existem na cena
var inimigos_existentes = instance_number(oEnemy);

// Verifica se o código ainda não foi executado e se a variável `active` está ativa
if (!executou_uma_vez && active) {
    // Se houver menos do que o número máximo de inimigos, cria novos
    if (inimigos_existentes < max_inimigos) {
        // Quantos inimigos ainda podem ser criados
        var inimigos_para_criar = max_inimigos - inimigos_existentes;

        // Cria os inimigos necessários para alcançar o máximo permitido
        for (var i = 0; i < inimigos_para_criar; i++) {
            var offset_x = random_range(-32, 32); // Define um deslocamento aleatório em x
            var offset_y = random_range(-32, 32); // Define um deslocamento aleatório em y
            instance_create_layer(x + offset_x, y + offset_y, "instance", oEnemy);
			global.life = 4
        }
    }

    // Marca a variável como verdadeira para impedir execuções futuras
    executou_uma_vez = true;
}
