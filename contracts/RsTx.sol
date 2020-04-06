pragma solidity 0.5.11;


contract RsTx {

    event NewRsTx(uint256 noncePointX, uint256 noncePointY, bytes encryptedRecipient);

    function rsTx(
        uint256 noncePointX,
        uint256 noncePointY,
        bytes calldata encryptedRecipient
    ) external {
        emit NewRsTx(noncePointX, noncePointY, encryptedRecipient);
    }
}
