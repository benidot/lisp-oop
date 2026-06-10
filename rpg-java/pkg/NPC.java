public class NPC {
    String nome;

    public NPC (String nome) {
        this.nome = nome;
    }

    public void say (String text) {
        System.out.println(this.nome + " diz: " + text);
    }

}
