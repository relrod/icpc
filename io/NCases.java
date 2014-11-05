/**
 * Reads N cases from stdin
 */

import java.util.Scanner;

public class NCases {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int cases = in.nextInt();

        in.nextLine();

        for (int i = 0; i < cases; i++) {
            String x = in.nextLine();
            String[] xs = x.split(" +");
            for (int ii = 0; ii < xs.length; ii++)
                System.out.println(xs[ii]);
        }
    }
}
