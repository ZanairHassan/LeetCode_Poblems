public class Solution {
    public bool IsPalindrome(int x) {
         string inputNumberString = x.ToString();
 int left = 0;
 int right = inputNumberString.Length - 1;
 while (left < right)
 {
     if (inputNumberString[left] != inputNumberString[right])
     {
         return false;
     }
     left++;
     right--;
 }
 return true;
    }
}