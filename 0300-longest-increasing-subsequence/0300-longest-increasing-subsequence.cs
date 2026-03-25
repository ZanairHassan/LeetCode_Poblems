public class Solution {
    public int LengthOfLIS(int[] nums) {
        int n = nums.Length;
    int[] testArray = new int[n];
    Array.Fill(testArray, 1);

    int maxLength = 1;

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < i; j++)
        {
            if (nums[j] < nums[i])
            {
                testArray[i] = Math.Max(testArray[i], testArray[j] + 1);
            }
        }
        maxLength = Math.Max(maxLength, testArray[i]);
    }
    return maxLength;
    }
}