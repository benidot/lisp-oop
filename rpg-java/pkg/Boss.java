public class Boss extends Monstro {
    int fase;
    int bonusDano;

    void atacar (Player player) {
        player.tomarDano(this.dano * bonusDano);
    }

}
