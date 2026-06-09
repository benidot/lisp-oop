public class Monstro {

    int vida;
    int dano;
    
    public Monstro () {

    }

    public Monstro (int vida, int dano) {
        this.vida = vida;
        this.dano = dano;
    }

    public void atacar (Player player) {
        player.tomarDano(this.dano);
    }

}
