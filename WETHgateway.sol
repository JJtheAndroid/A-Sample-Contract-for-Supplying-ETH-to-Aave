// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "https://github.com/aave/aave-v3-periphery/blob/7a9542963b8030885443800179c57ff8ffdac29c/contracts/misc/interfaces/IWETHGateway.sol";
import {IPool} from "@aave/core-v3/contracts/interfaces/IPool.sol";
import {IPoolAddressesProvider} from "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";



contract WETHGateway  {

 receive() external payable {}

 address public constant WETHgatewayaddress = 0xd5B55D3Ed89FDa19124ceB5baB620328287b915d;

 IWETHGateway public WETHgatewaycontract;


IPoolAddressesProvider public ADDRESSES_PROVIDER;
IPool public POOL;

address public pooladdress = 0x368EedF3f56ad10b9bC57eed4Dac65B26Bb667f6;

    //this address is for Goerli
    address public aWETH = 0x27B4692C93959048833f40702b22FE3578E77759;



constructor() {

 WETHgatewaycontract = IWETHGateway(WETHgatewayaddress);
 POOL = IPool(0xc4dCB5126a3AfEd129BC3668Ea19285A9f56D15D);
 approveWETH();

}




function depostitETH () external payable {

WETHgatewaycontract.depositETH{value: .001 ether}(pooladdress, address(this), 0);

}


function WithdrawETH () external  {

    WETHgatewaycontract.withdrawETH(pooladdress, type(uint256).max, address(this));

    selfdestruct(payable(msg.sender));
}


 function approveWETH() internal
    {
        IERC20(aWETH).approve(WETHgatewayaddress,  type(uint256).max);
   
        IERC20(aWETH).approve(pooladdress,  type(uint256).max);
    }

 
 function seeWETHbalance () external view returns (uint) {

     return IERC20(aWETH).balanceOf(address(this));

 }




}
   
