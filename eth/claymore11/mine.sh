#!/bin/sh

 export GPU_MAX_HEAP_SIZE=100

export GPU_USE_SYNC_OBJECTS=1

export GPU_MAX_ALLOC_PERCENT=100

export GPU_SINGLE_ALLOC_PERCENT=100

#./ethdcrminer64 -epool <Mining_Pool_Address> -ewal <Your_Ethereum_Wallet_Address>.<Friendly_Name_For_Computer> -epsw x -mode 1 -tt 68 -allpools 1
./ethdcrminer64 -epool eth-us-west1.nanopool.org:9999 -ewal 0x19CdC764ffa66935ea340F80d43c122510eBBc43.ml-44/ryan.lio.crypto@gmail.com -epsw x -mode 1 -ftime 10 -tt 75 -tstop 90  -fanmin 90,90,90 -di 012
