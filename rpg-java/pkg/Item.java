public class Item {

    String nome;
    int bonusVida;
    int bonusDano;

    public Item () {

    }

    public Item (String nome, int bonusVida, int bonusDano) {
        this.nome = nome;
        this.bonusDano = bonusDano;
        this.bonusVida = bonusVida;
    }
}
