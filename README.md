# DAG Exercise

This repository consists of 5 components.

## Network
- Spawns miners upon initialization
- In charge of choosing the next block producer

## Miner
- Creates blocks
- Adds blocks to his DAG
- Propagate blocks to his peers

## DAG
- Create new block (with parent randomly selected from current tips)
- Add blocks to graph

## Block
- Simple object with unique ID (only ABC are supported as IDs in this version for simplicity)


## App
- File to run the simulation (parameters are hard-coded in this file)


To run the program please use the following command
```
ruby app.rb
```

