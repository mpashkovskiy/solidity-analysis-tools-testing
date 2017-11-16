Solidity Analysis Tools Testing
===============================

Docker images with analysis tools and set of contracts to test.

Contracts:

* `Bank_*.sol` - buggy and correct contract from JJ
* `Government.sol` - real contract with security bug from https://www.reddit.com/r/ethereum/comments/4ghzhv/governmentals_1100_eth_jackpot_payout_is_stuck/
* `hkg-token-*.sol` - buggy and correct implementation of [EIP20 standard](https://github.com/ethereum/EIPs/issues/20) token

Prerequisites:

* Docker

To remove unused Docker images and containers after execution run `./cleanup.sh`

## Oyente

Oyente: https://github.com/melonproject/oyente
Making Smart Contracts Smarter: http://www.comp.nus.edu.sg/~loiluu/papers/oyente.pdf
Docker file: `oyente/Dockerfile`

To run Docker container with Oyente execute:

```
docker build -f oyente/Dockerfile -t oyente .
docker run -it oyente
```

This will open the container's shell with installed Oyente, dependencies and contracts from `contracts` folder.
To analyze contract run

```
python oyente.py -a -s contracts/[contract name]
```

The only contract where Oyente finds security bugs is `contracts/Government.sol`. The bugs are:

* Callstack Depth Attack Vulnerability
* Transaction-Ordering Dependence (TOD)
* Timestamp Dependency
* Assertion Failure

## ToDo

* add tools:
 * https://github.com/trailofbits/manticore
 * https://github.com/b-mueller/mythril/
 * https://protofire.github.io/solhint/
* add contrats

