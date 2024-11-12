// Evento Collision (bala vs inimigo)

// Check if the player is sliding
if (!other.is_sliding) {
    // Player is not sliding; apply collision effects
    with (other) {
        global.life--;  // Reduce life

        // Play damage sound
        audio_play_sound(som_dano, 1, false);

        // If life is zero or less, handle game over
        if (global.life <= 0) {
            instance_destroy();  // Destroy the player instance
           room_goto(rm_menu);  // Go to the menu room
            game_restart();      // Restart the game
        }
    }
}

// Destroy the bullet after the collision
instance_destroy();