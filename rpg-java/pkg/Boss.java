public class Boss extends Monstro {
    int fase = 1;
    int bonusDano = 1;

    public Boss () {

    }

    public Boss (String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public void atacar (Player player) {
        player.tomarDano(this.dano * bonusDano);
    }

}
