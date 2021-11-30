// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

// Author: Khashkhuu 'Xass1on' Gankhuyag

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";

contract BRBToken is ERC20, Ownable {
    using SafeMath for uint256;
    TokenTimelock public teamTimelock;
    TokenTimelock public investorTimelock;
    TokenTimelock public cooperationTimelock;
    TokenTimelock public rewardTimelock;
    TokenTimelock public burnTimelock;

    uint256 constant _totalSupply = 3 * 10**11;

    uint256 constant _tokenToOffer = 1.2 * 10**11;
    uint256 constant _tokenTeamReserve = 3 * 10**10;

    uint256 constant _tokenInvestor = 5.2 * 10**10;
    uint256 constant _tokenCooperation = 8 * 10**9;

    uint256 constant _tokenReward = 3 * 10**10;
    uint256 constant _tokenLiquidity = 3 * 10**10;

    uint256 constant _tokenBurn = 1.5 * 10**10;
    uint256 constant _tokenStrategicReserve = 1.5 * 10**10;

    string constant _tokenName = "BRB Coin";
    string constant _tokenSymbol = "BRB";

    address constant _tokenOfferAddress =
        0x3321A4A629FeD506C67A166d2f5e5f418e2042d6;
    address constant _tokenTeamReserveAddress =
        0xbf77D3998BA356df9EE212E1C99C867215bF93FC;

    address constant _tokenInvestorAddress =
        0x512f7059794B5f8CB363C42D4e7823aA15d6db5b;
    address constant _tokenCooperationAddress =
        0xCDeC88164f2A28C6CcD45cA148373D9263f6A9f7;

    address constant _tokenRewardAddress =
        0xd5c37f1867f97ffa7828Ce70027D436967F698eB;
    address constant _tokenLiquidityAddress =
        0x8bD4aA42cE9F3C63437AB42d1cE76C2CbAc3a3FC;

    address constant _tokenBurnAddress =
        0x78326594bfeEAdC23c8AB931B62428f1EaC77Db8;
    address constant _tokenStrategicReserveAddress =
        0x98f5E74B183ab8C4b03EB0c19EAA63360d256945;

    constructor() ERC20(_tokenName, _tokenSymbol) {
        // Sales
        _mint(_tokenOfferAddress, _tokenToOffer * 10**18);

        // Team Reserve
        teamTimelock = new TokenTimelock(
            this,
            _tokenTeamReserveAddress,
            block.timestamp + 60 * 60 * 24 * 365 * 2
        );
        _mint(address(teamTimelock), _tokenTeamReserve * 10**18);

        // Strategic investor
        investorTimelock = new TokenTimelock(
            this,
            _tokenInvestorAddress,
            block.timestamp + 60 * 60 * 24 * 365 * 1
        );
        _mint(address(investorTimelock), _tokenInvestor * 10**18);

        // Cooperation
        cooperationTimelock = new TokenTimelock(
            this,
            _tokenCooperationAddress,
            block.timestamp + 60 * 60 * 24 * 15
        );
        _mint(address(cooperationTimelock), _tokenCooperation * 10**18);

        // Reward
        rewardTimelock = new TokenTimelock(
            this,
            _tokenRewardAddress,
            block.timestamp + 60 * 60 * 24 * 30 * 1
        );
        _mint(address(rewardTimelock), _tokenReward * 10**18);

        // Liquidity
        _mint(_tokenLiquidityAddress, _tokenLiquidity * 10**18);

        // Burn
        burnTimelock = new TokenTimelock(
            this,
            _tokenBurnAddress,
            block.timestamp + 60 * 60 * 24 * 30 * 3
        );
        _mint(address(burnTimelock), _tokenBurn * 10**18);
    }

    fallback() external payable {
        revert();
    }

    receive() external payable {
        revert();
    }
}
