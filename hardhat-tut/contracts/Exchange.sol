// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Exchange is ERC20 {

    address public LTokenAddress;

    // Exchange is inheriting ERC20, because our exchange would keep track of Crypto Dev LP tokens
    constructor(address _Ltoken) ERC20("LToken", "LT") {
        require(_Ltoken != address(0), "Token address passed is a null address");
        LTokenAddress =_Ltoken;
    }

    function getLTReserve( ) public view returns (uint256) {
        return ERC20(LTokenAddress).balanceOf(address(this));
    }
}