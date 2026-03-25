public class Solution {
    public int NumSquares(int n) {
          int[] testNumbers = new int[n + 1];
    for (int i = 0; i <= n; i++)
    {
        testNumbers[i] = int.MaxValue;
    }
    testNumbers[0] = 0;

    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j * j <= i; j++)
        {
            testNumbers[i] = Math.Min(testNumbers[i], testNumbers[i - j * j] + 1);
        }
    }
    return testNumbers[n];
    }
}