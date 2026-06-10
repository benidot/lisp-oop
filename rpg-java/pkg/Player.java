import java.util.ArrayList;
import java.util.Scanner;

public class Player {

    String nome;
    int vida = 1000;
    int dano = 5;
    int nivel = 1;
    Boolean morto = false;
    ArrayList<Item> itens = new ArrayList<>();
    ArrayList<Pocao> curas = new ArrayList<>();
    public static void main(String[] args) {
        
    }

    public Player () {

    }

    public Player (String nome) {
        this.nome = nome;
        System.out.println("Um jogador aparece! Seu nome é " + this.nome + "!");
    }

    public void tomarDano (int dano) {
        this.vida -= dano;
        if(this.vida <= 0) {
            this.morto = true;
            System.out.println(this.nome + " morreu");
        }
    }

    public void atacar (Monstro monstro) {
        int danoFinal = dano;
        for (int i = 0; i < itens.size(); i++) {
            danoFinal += itens.get(i).bonusDano;
        }
        System.out.println(this.nome + " ataca! o inimigo tomou " + danoFinal + " de dano!");
        monstro.tomarDano(danoFinal);
        if(monstro.morto) {
            this.nivel += 1;
            System.out.println(this.nome + " passou de nivel para " + this.nivel + "!");
        }
    }

    public void addItem (Item item) {
        itens.add(item);
    }

    public void addPocao (Pocao pocao) {
        curas.add(pocao);
    }

    public Boolean prompt (Monstro monstro) {
        int whi = 1;
        Boolean passou = false;
        while (1 == whi) {
            System.out.println("Vida: " + this.vida);
            System.out.println("O que fará? 1. Atacar - 2. Curar");
            Scanner in = new Scanner(System.in);
            int choice = in.nextInt();
            in.close();
            if (choice == 1) {
                atacar(monstro);
            } else if (choice == 2) {
                curar(monstro);
            }
            if (monstro.morto == true) {
                passou = true;
                break;
            }
            if (this.morto == true) {
                break;
            }
            monstro.suaVez(this);
        }

        if (passou == false) {
            System.out.println("Falhou");
        }

        return passou;

    }

    public void usarPocao (int choice) {
        this.vida += curas.get(choice).bonus;
        curas.remove(choice);
        System.out.println("Pocao usada!");
    }

    public void curar (Monstro monstro) {
        System.out.println("Itens de cura: (ou -1 para voltar)");
        for(int i = 0; i < curas.size(); i++) {
            System.out.println(i + " - " + curas.get(i).nome + " - Bonus: " + curas.get(i).bonus);
        }
        Scanner in = new Scanner(System.in);
        int choice = in.nextInt();
        in.close();
        if (choice == -1) {
            prompt(monstro);
        } else {
            usarPocao(choice);
        }

    }

}