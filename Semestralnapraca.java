package semestralnapraca;

import java.util.Scanner;

public class Semestralnapraca {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println("Pokracovat ve zpracovani (a/n):");
            String odpoved = sc.nextLine();
            odpoved = odpoved.toLowerCase();
            if (odpoved.equals("a")) {
                System.out.println("Zadej pocet bodu:");
                int n = sc.nextInt();
                Bod[] pole = new Bod[n];
                System.out.println("Zadej souradnice bodu:");
                for (int i = 0; i < n; i++) {
                    Bod b = new Bod(sc.nextDouble(), sc.nextDouble(), sc.nextDouble());
                    pole[i] = b;
                }
                Bod swap;
                for (int j = 0; j < pole.length; j++) {
                    for (int i = 0; i < pole.length - 1; i++) {
                        if (pole[i].vzdialenost() > pole[i + 1].vzdialenost()) {
                            swap = pole[i];
                            pole[i] = pole[i + 1];
                            pole[i + 1] = swap;
                        }
                    }
                }
                System.out.println("Setridene body");
                for (int i = 0; i < pole.length; i++) {
                    pole[i].vypis();
                }
                sc.nextLine();
            } else if (odpoved.equals("n")) {
                return;
            }
        }
    }
}
