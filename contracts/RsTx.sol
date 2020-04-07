pragma solidity 0.5.11;


contract RsTx {

    event NewRsTx(bytes noncePoint, bytes encryptedRecipient);

    function rsTx(
        bytes calldata noncePoint,
        bytes calldata encryptedRecipient
    ) external {
        emit NewRsTx(noncePoint, encryptedRecipient);
    }
}
