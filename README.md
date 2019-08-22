# ipfs-contracts
Record IPFS hash to Ethereum contract

## Dependencies
| Name | Version |
| ------------- | ------------- |
| node  | 10.15.3  |
| npm  | 6.9.0  |

## Getting start
Export environment configurations
```
export ETH_DEPLOYER_KEY='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
export ETH_NODE_URL='http://xxx.xxx.xxx.xxx:8545'
```
Install dependencies
```
npm install
```

Compile
```
npm run compile
```

Deploy
```
npm run ganache-cli:start & npm run migrate:dev
```

Test
```
npm test
```

## ガスコスト比較
ログだけの方が`25`倍も安い。したがって、IPFSハッシュはログとして記録する

### 配列へ格納する場合
初回：`83106` gas
2回目以降: `68106` gas

### ログだけの場合
`2632` gas
