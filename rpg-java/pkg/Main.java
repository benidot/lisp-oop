public class Main {

    public static void batalhar(Player player, Monstro monstro) {
        Boolean passou = player.prompt(monstro);
        if(!passou) {
            player = null;
        }
        return;
    }
    public static void main(String[] args) {
        Player player = new Player("Senua");
        Monstro zumbi = new Monstro("Zumbi", 5, 200);
        Item anel = new Item("Anel de Poder", 5, 2);
        player.addItem(anel);
        player.addPocao(new Pocao("Cura", 5));
        
        batalhar(player, zumbi);

        Boss boss = new Boss("Chefe", 2000);
        batalhar(player, boss);

    }
}
