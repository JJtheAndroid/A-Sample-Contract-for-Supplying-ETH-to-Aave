# A Sample Contract for Supplying ETH to Aave
This is a sample contract that supplies native ETH directly to Aave. Usually defi protocols require WETH to use, but Aave has a really useful
helper contract in WETH gateway that automatically converts native ETH to aWETH and then autmatically supplies them to the protocol where 
they can earn interest.




## This is a really simple contract to use and modify. Remix is recommended for this contract


Step 1: Supply .001 ETH and hit the depositETH button (you can change this number in the contract)

Step 2: See your balance + profit with the seeWETHbalance function

Step 3: Press withdraw ETH to get your balance + profit! That's it!





Note: This contract is made for the Goerli network. Addresses are hard coded for convience. Please refer to Aave docs in order to modify this contract
for other networks.
