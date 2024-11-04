/**  
 * @param {number} x
 * @return {boolean}
 */
var isPalindrome = function(x) {
    let abc = String(x).split("").reverse().join("")
    return abc == x
    
};