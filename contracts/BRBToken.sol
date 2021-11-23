// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

// Author: Khashkhuu 'Xass1on' Gankhuyag

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract BRBToken is ERC20, Ownable {
    using SafeMath for uint256;

    uint256 constant _totalSupply = 3 * 10**11;

    uint256 constant _tokenToOffer = 1.2 * 10**11;

    uint256 constant _tokenTeamReserve = 3 * 10**10;
    uint256 constant _tokenStrategicReserve = 6 * 10**10;
    uint256 constant _tokenLiquidity = 3 * 10**10;
    uint256 constant _tokenLoyalty = 3 * 10**10;
    uint256 constant _tokenBurn = 3 * 10**10;

    string constant _tokenName = "BRB Coin";
    string constant _tokenSymbol = "BRB";

    address constant _tokenOfferAddress =
        0x3F35473075Bc28e632a881a19E271C12c7f48c8E;

    address constant _tokenTeamReserveAddress =
        0xB6Bad08ad4ae5F4b9a6A5f4076C37655D281f37f;
    address constant _tokenStrategicReserveAddress =
        0x3340Da47BFf41B85C925Ea840E81a45a84A6a1a1;
    address constant _tokenLiquidityAddress =
        0xb43689fD00b0EC09cc9971741F642519329FE9c4;
    address constant _tokenLoyaltyAddress =
        0x36f980FF1719A51EE03c7EDEBfaF74c25E37d65C;
    address constant _tokenBurnAddress =
        0xB6Bad08ad4ae5F4b9a6A5f4076C37655D281f37f;

    constructor() ERC20(_tokenName, _tokenSymbol) {
        // Sales
        _mint(_tokenOfferAddress, _tokenToOffer * 10**18);

        // Team Reserve
        _mint(_tokenTeamReserveAddress, _tokenTeamReserve * 10**18);

        // Strategic Reserve
        _mint(_tokenStrategicReserveAddress, _tokenStrategicReserve * 10**18);

        // Liquidity
        _mint(_tokenLiquidityAddress, _tokenLiquidity * 10**18);

        // Loyalty
        _mint(_tokenLoyaltyAddress, _tokenLoyalty * 10**18);

        // Burn
        _mint(_tokenBurnAddress, _tokenBurn * 10**18);
    }

    fallback() external payable {
        revert();
    }

    receive() external payable {
        revert();
    }
}
