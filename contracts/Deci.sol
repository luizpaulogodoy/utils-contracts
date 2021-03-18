//SPDX-License-Identifier: MIT
pragma solidity >=0.7.4;

library Deci {
    uint constant TEN18 = 10**18;
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, "uint overflow from multiplication");
        return c;
    }
    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "division by zero");
        uint256 c = a / b;
        return c;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "uint underflow from subtraction");
        uint256 c = a - b;
        return c;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "uint overflow from multiplication");
        return c;
    }
      // 18 Decimal places
    function decMul18(uint x, uint y) public pure returns (uint decProd) {
        uint prod_xy = mul(x, y);
        decProd = add(prod_xy, TEN18 / 2) / TEN18;
    }
    
    function decDiv18(uint x, uint y) public pure returns (uint decQuotient) {
        uint prod_xTEN18 = mul(x, TEN18);
        decQuotient = add(prod_xTEN18, y / 2) / y;
    }
}