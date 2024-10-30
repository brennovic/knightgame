target = oPlayer;  // Objeto que a câmera seguirá
lerp_speed = 0.1;     // Velocidade de interpolação suave
zoom = 3.0;           // Nível inicial de zoom (1.0 = normal, 0.5 = mais perto, 2.0 = mais longe)
target_zoom = 3.0;    // Zoom desejado (usado para interpolação)
min_zoom = 0.5;       // Zoom máximo (mais próximo)
max_zoom = 10.0;       // Zoom mínimo (mais afastado)