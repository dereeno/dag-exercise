# DAGLabs Exercise

This repository consists of 5 components.

## Network
- Spawns miners upon initialization
- in charge of choosing the next block producer

## Miner
- creates blocks
- adds blocks to his DAG
- propagate blocks to his peers

## DAG
- create new block (with parent randomly selected from current tips)
- add blocks to graph

## Block
- Simple object with unique ID (only ABC are supported as IDs in this version for simplicity)


## App
- file to run the simulation (parameters are hard-coded in this file)


to run the program please use the following command
`
ruby app.rb
`

