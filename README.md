Solidity Analysis Tools Testing
===============================

Docker images with analysis tools and set of contracts to test.

Contracts:

* `contracts/Bank_*.sol` - buggy and correct contract from JJ
* `contracts/Government.sol` - real contract with security bug from https://www.reddit.com/r/ethereum/comments/4ghzhv/governmentals_1100_eth_jackpot_payout_is_stuck/
* `contracts/hkg-token-*.sol` - buggy and correct implementation of [EIP20 standard](https://github.com/ethereum/EIPs/issues/20) token

Prerequisites:

* [Docker](https://www.docker.com/)

To remove unused Docker images and containers after execution run `./cleanup.sh`

## Oyente

* Oyente: https://github.com/melonproject/oyente
* Making Smart Contracts Smarter: http://www.comp.nus.edu.sg/~loiluu/papers/oyente.pdf
* Docker file: `oyente/Dockerfile`

To run Docker container with Oyente execute:

```
docker build -f oyente/Dockerfile -t oyente .
docker run -it oyente
```

This will open the container's shell with installed Oyente, dependencies and contracts from `contracts` folder.

To analyze a contract run

```
python oyente.py -a -s contracts/[contract name]
```

The only contract where Oyente finds security bugs is `contracts/Government.sol`. The bugs are:

* [Callstack Depth Attack Vulnerability](https://consensys.github.io/smart-contract-best-practices/known_attacks/#call-depth-attack-deprecated)
* [Transaction-Ordering Dependence (TOD)](https://consensys.github.io/smart-contract-best-practices/known_attacks/#transaction-ordering-dependence-tod-front-running)
* [Timestamp Dependency](https://consensys.github.io/smart-contract-best-practices/known_attacks/#timestamp-dependence)
* Assertion Failure

## ToDo

* add tools:
  * new version of https://github.com/jarjuk/sbuilder-ethereum once it will be available
  * https://github.com/trailofbits/manticore
  * https://github.com/b-mueller/mythril/
  * https://protofire.github.io/solhint/
* add contrats

