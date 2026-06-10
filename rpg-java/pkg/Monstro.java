public class Monstro {

    String nome;
    int vida;
    int dano;
    Boolean morto = false;
    
    public Monstro () {
        System.out.println("Um monstro aparece!");
    }

    public Monstro (String nome, int vida, int dano) {
        this.nome = nome;
        this.vida = vida;
        this.dano = dano;
        System.out.println("Um monstro aparece! É um... " + this.nome + "!");
    }

    public void atacar (Player player) {
        System.out.println(this.nome + " ataca " + player.nome + "e da " + this.dano + " de dano!");
        player.tomarDano(this.dano);
    }

    public void tomarDano (int dano) {
        this.vida -= dano;
        if(this.vida <= 0) {
            this.morto = true;
            System.out.println(this.nome + " é derrotado!");
        }
    }

    public void suaVez (Player player) {
        atacar(player);
    }

}
