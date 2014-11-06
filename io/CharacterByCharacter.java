import java.util.Scanner;
import java.util.regex.Pattern;

class CharacterByCharacter {

    private static final Pattern WHITESPACE_PATTERN = Pattern.compile("\\p{javaWhitespace}+");
    private static final Pattern EMPTY_PATTERN = Pattern.compile("");

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        for (int i = 0; i < 8; i++) {
            for (int k = 0; k < 8; k++) {
                in.useDelimiter(EMPTY_PATTERN);
                if (!in.hasNext())
                    continue;
                char x = in.next().charAt(0);
                in.useDelimiter(WHITESPACE_PATTERN);
                System.out.println("Got char: " + x);
            }

            if (!in.hasNextLine())
                continue;
            in.nextLine();
        }
    }
}
