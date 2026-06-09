import java.util.ArrayList;

public class Player {

    String nome;
    int vida;
    int dano;
    Boolean morto = false;
    ArrayList<Item> itens = new ArrayList<>();
    public static void main(String[] args) {
        
    }

    public Player () {

    }

    public void tomarDano (int dano) {
        this.vida -= dano;
        if(this.vida <= 0) {
            this.morto = true;
            System.out.println(this.nome + " morreu");
        }
    }
}