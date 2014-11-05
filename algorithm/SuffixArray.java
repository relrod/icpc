import java.util.Arrays;

class SuffixArray {
    private Suffix[] suffixes;

    public SuffixArray(String s) {
        int len = s.length();
        suffixes = new Suffix[len];
        for (int i = len - 1; i >= 0; i--)
            suffixes[i] = new Suffix(s.substring(i), i);
        Arrays.sort(suffixes);
    }

    public Suffix[] getSuffixes() {
        return this.suffixes;
    }

    public int search(String query) {
        int low = 0;
        int high = this.suffixes.length - 1;
        int mid = -1;
        int midCompared = -1;
        Suffix midSuffix;
        while (low <= high) {
            mid = (low + high) / 2;
            midSuffix = this.suffixes[mid];
            midCompared = query.compareTo(midSuffix.toString());
            if (midCompared > 0)
                low = mid + 1;
            else if (midCompared < 0)
                high = mid - 1;
            else
                return mid;
        }
        return -1;
    }

    public class Suffix implements Comparable<Suffix> {
        private String val;
        private int index;

        public Suffix(String val, int index) {
            this.val = val;
            this.index = index;
        }

        @Override
        public String toString() {
            return this.val;
        }

        public int length() {
            return val.length();
        }

        @Override
        public int compareTo(Suffix that) {
            if (this == that) return 0;
            int min = Math.min(this.length(), that.length());
            for (int i = 0; i < min; i++)
                if (this.val.charAt(i) > that.val.charAt(i))
                    return 1;
                else if (this.val.charAt(i) < that.val.charAt(i))
                    return -1;
            return this.length() - that.length();
        }
    }

    /**
     * This function exists only as a test.
     */
    public static void main(String[] args) {
        SuffixArray x = new SuffixArray("banana$");
        SuffixArray.Suffix[] xs = x.getSuffixes();
        for (int i = 0; i < xs.length; i++)
            System.out.println(xs[i].toString());
        System.out.println("Search:");
        System.out.println(x.search("asdf"));
        System.out.println(x.search("ana$"));
        System.out.println(xs[x.search("ana$")]);
    }
}
