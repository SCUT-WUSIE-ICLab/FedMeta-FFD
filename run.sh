#!/bin/bash

# - strategy: FedAvg, FedMetaMAML, FedAvgMeta, FedMetaSGD
# - model: femnist, mnist, cifar

# fedMeta on local and new client (mnist)
# v1.0
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50

#v2.0
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=50 --rounds=10 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=50 --rounds=30 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=50 --rounds=30 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=50 --rounds=30 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=50 --rounds=30 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=50 --rounds=30 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=50 --rounds=30 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=50 --rounds=30 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50

#v2.0 frac=0.5
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50

#v3.0 for cwru iid
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=10 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=10 --min_available_clients=10
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=10 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=10 --min_available_clients=10
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=10 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=10 --min_available_clients=10
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=10 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=10 --min_available_clients=10
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=10 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=10 --min_available_clients=10
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=10 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=10 --min_available_clients=10
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=10 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=10 --min_available_clients=10
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=10 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=10 --min_available_clients=10

#v4.0 for pu non-iid local=1
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=39 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=39 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=39 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=39 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=39 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=39 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=39 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=39 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39


#v4.0 for pu non-iid local=3
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=39 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=39 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=39 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=39 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=39 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=39 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=39 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=39 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=39 --min_available_clients=39
# v5.0 for pu iid
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=9 --rounds=300 --epochs=2 --batch_size=32 --min_fit_clients=3 --min_eval_clients=9 --min_available_clients=9
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=9 --rounds=300 --epochs=2 --batch_size=32 --min_fit_clients=3 --min_eval_clients=9 --min_available_clients=9
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=9 --rounds=300 --epochs=2 --batch_size=32 --min_fit_clients=3 --min_eval_clients=9 --min_available_clients=9
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=9 --rounds=300 --epochs=2 --batch_size=32 --min_fit_clients=3 --min_eval_clients=9 --min_available_clients=9
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=9 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=9 --min_available_clients=9
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=9 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=9 --min_available_clients=9
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=9 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=9 --min_available_clients=9
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=9 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=3 --min_eval_clients=9 --min_available_clients=9

# v6.0 for cwru non-iid local = 3
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=50 --rounds=300 --epochs=3 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50

# # fedMetaPer on local and new client (mnist)
# python main.py --alpha=0.000005 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --per_layer=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50 # cant run because it cann't be fine-tuned at inference phase
# python main.py --alpha=0.000005 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --per_layer=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.000005 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --per_layer=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.000005 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --per_layer=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0003 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --per_layer=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --per_layer=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --per_layer=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.0005 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --per_layer=1 --num_clients=50 --rounds=300 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50

# meta new cifar vs per new cifar
# python main.py --alpha=0.0001 --beta=0.0 --strategy_client='FedAvg' --model='cifar' --new_client=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.0001 --beta=0.0 --strategy_client='FedAvg' --model='cifar' --new_client=1 --per_layer=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50 # cant run because it cann't be fine-tuned at inference phase
# python main.py --alpha=0.0001 --beta=0.0 --strategy_client='FedAvgMeta' --model='cifar' --new_client=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.0001 --beta=0.0 --strategy_client='FedAvgMeta' --model='cifar' --new_client=1 --per_layer=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.01 --beta=0.001 --strategy_client='FedMetaMAML' --model='cifar' --new_client=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.01 --beta=0.0007 --strategy_client='FedMetaMAML' --model='cifar' --new_client=1 --per_layer=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.01 --beta=0.001 --strategy_client='FedMetaSGD' --model='cifar' --new_client=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.01 --beta=0.001 --strategy_client='FedMetaSGD' --model='cifar' --new_client=1 --per_layer=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50

# per old cifar vs meta old cifar
# python main.py --alpha=0.0001 --beta=0.0 --strategy_client='FedAvg' --model='cifar' --new_client=0 --per_layer=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.0001 --beta=0.0 --strategy_client='FedAvg' --model='cifar' --new_client=0 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.0001 --beta=0.0 --strategy_client='FedAvgMeta' --model='cifar' --new_client=0 --per_layer=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.0001 --beta=0.0 --strategy_client='FedAvgMeta' --model='cifar' --new_client=0 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.003 --strategy_client='FedMetaMAML' --model='cifar' --new_client=0 --per_layer=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.01 --beta=0.001 --strategy_client='FedMetaMAML' --model='cifar' --new_client=0 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.01 --beta=0.01 --strategy_client='FedMetaSGD' --model='cifar' --new_client=0 --per_layer=1 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaSGD' --model='cifar' --new_client=0 --num_clients=50 --rounds=600 --epochs=1 --batch_size=32 --min_fit_clients=5 --min_eval_clients=50 --min_available_clients=50

# scut v1
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=0 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=1 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='mnist' --new_client=0 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=1 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='mnist' --new_client=0 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=1 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='mnist' --new_client=0 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35

# scut v2
python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='mnist' --new_client=1 --num_clients=35 --rounds=5 --epochs=1 --batch_size=32 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvg' --model='scut' --new_client=0 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='scut' --new_client=1 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.00001 --beta=0.0 --strategy_client='FedAvgMeta' --model='scut' --new_client=0 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='scut' --new_client=1 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.001 --beta=0.001 --strategy_client='FedMetaMAML' --model='scut' --new_client=0 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='scut' --new_client=1 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35
# python main.py --alpha=0.001 --beta=0.0002 --strategy_client='FedMetaSGD' --model='scut' --new_client=0 --num_clients=35 --rounds=300 --epochs=3 --batch_size=64 --min_fit_clients=15 --min_eval_clients=35 --min_available_clients=35