# ipfs-contracts
Record IPFS hash to Ethereum contract

## Dependencies
| Name | Version |
| ------------- | ------------- |
| node  | 10.15.3  |
| yarn  | 1.22.10  |

## Getting start
Export environment configurations
```
export ETH_DEPLOYER_KEY='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
export ETH_NODE_URL='http://xxx.xxx.xxx.xxx:8545'
```
Install dependencies
```
yarn
```

Compile
```
yarn run compile
```

Deploy
```
yarn run ganache-cli:start & npm run migrate:dev
```

Test
```
yarn test
```

## ガスコスト比較
ログだけの方が`25`倍も安い。したがって、IPFSハッシュはログとして記録する

### 配列へ格納する場合
初回：`83106` gas
2回目以降: `68106` gas

### ログだけの場合
`2632` gas

# License
[Apache License Version 2.0](https://github.com/cryptoichiba/ipfs-contracts/blob/master/LICENCE)
