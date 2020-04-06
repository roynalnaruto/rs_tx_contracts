pragma solidity 0.5.11;


contract RsTx {

    event NewRsTx(uint256 noncePointX, uint256 noncePointY);

    function rsTx(uint256 noncePointX, uint256 noncePointY) external {
        emit NewRsTx(noncePointX, noncePointY);
    }
}
