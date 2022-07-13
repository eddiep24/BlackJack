#!/bin/bash

declare -a arr=()
declare -i runningSum = 0




printf "__________.__                 __        ____.              __\n"
printf "\______   \\  | _____    ____ |  | __   |    |____    ____ |  | __\n"
printf " |    |  _/  | \\__  \\ _/ ___\\|  |/ /   |    \\__  \\ _/ ___\\|  |/ /\n"
printf " |    |   \\  |__/ __ \\\\   \\___|    </\\__|    |/ __ \\\\  \\____|    < \n"
printf " |______  /____(____  /\\___  >__|_ \\________(____  /\\___  >__|_ \\ \n"
printf "        \\/          \\/     \\/     \\/             \\/     \\/     \\/\n"
printf "by Eddie Phillips\n"


function basic_strategy() {
    clear

    printf "|           |             Dealer Upcard             |\n"
    printf "|Hard Total | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10| A |\n"
    printf "%s\n" "-----------------------------------------------------"
    printf "|   5-7     | H | H | H | H | H | H | H | H | H | H |\n"
    printf "|    8      | H | H | H | H | H | H | H | H | H | H |\n"
    printf "|    9      | H | D | D | D | D | H | H | H | H | H |\n"
    printf "|    10     | D | D | D | D | D | D | D | D | H | H |\n"
    printf "|    11     | D | D | D | D | D | D | D | D | D | D |\n"
    printf "|    12     | H | H | S | S | S | H | H | H | H | H |\n"
    printf "|    13     | S | S | S | S | S | H | H | H | H | H |\n"
    printf "|    14     | S | S | S | S | S | H | H | H | H | H |\n"
    printf "|    15     | S | S | S | S | S | H | H | H | R | R |\n"
    printf "|    16     | S | S | S | S | S | H | H | R | R | R |\n"
    printf "|    17     | S | S | S | S | S | S | S | S | S | RS|\n"
    printf "|Soft Total | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 | A |\n"
    printf "|   A,2     | H | H | H | D | D | H | H | H | H | H |\n"
    printf "|   A,3     | H | H | H | D | D | H | H | H | H | H |\n"
    printf "|   A,4     | H | H | D | D | D | H | H | H | H | H |\n"
    printf "|   A,5     | H | H | D | D | D | H | H | H | H | H |\n"
    printf "|   A,6     | H | D | D | D | D | H | H | H | H | H |\n"
    printf "|   A,7     |DS |DS |DS |DS |DS | S | S | H | H | H |\n"
    printf "|   A,8     | S | S | S | S |DS | S | S | S | S | S |\n"
    printf "|   A,9     | S | S | S | S | S | S | S | S | S | S |\n\n"
}

function instructions() {
    printf "\n[1] for Basic Strategy Cheat Sheet\n"
    printf "[2] for Blackjack practice\n"
    printf "[3] for practice counting cards\n"
    echo "[4] exit\n"
    read input
}

function blackjack() {
    printf "coming soon";
}

function printCardCounting() {
    case $curNum in
        11)
            printf "J\n"
            ;;
        12)
            printf "Q\n"
            ;;
        13)
            printf "K\n"
            ;;
        *)
            printf "$curNum\n"
            ;;
    esac
    sleep 1
}

function cardcounting() {
    clear
    printf "The most popular card counting strategy by far is High-Low.  In this, cards 2 to 6 are given\n"
    printf "a +1 value, cards 10 to A are given a -1 value, and cards 7, 8, and 9 are given a value of 0.\n"
    printf "The idea is that as the game goes on, the player wants to keep a running sum based on the\n"
    printf "assigned values.  A lower running sum is indicative of a deck that has less high cards,\n"
    printf "therefore a lower winning probability, and the inverse is true.  Let's start.\n"
    while [[ 1 -eq 1 ]]; do

        for n in 0 1 2 3 4; do
            curNum=$(shuf -i 1-13 -n1)
            if [[ $curNum -gt 9 ]]; then
                runningSum=$((runningSum-1))
            elif [[ $curNum -lt 7 ]]; then
                runningSum=$((runningSum+1))
            fi
            printCardCounting
        done
        printf "Current running sum is $runningSum\n"

        printf "Would you like to continue? (y/n)\n"
        read temp
        if [[ $temp = n || $temp = N ]]; then
            break
        fi
    done

}

function main() {
    while [[ 1 -eq 1 ]]; do
        sleep 1
        instructions
        case $input in
            4) #exit
                exit 0
                ;;
            3) # Counting Cards FUNCTIONAL
                cardcounting
                ;;
            2) # Blackjack TODO
                blackjack
                ;;
            1) # Basic Strategy DONE
                basic_strategy
                ;;
            *)
                continue
                ;;
        esac
    done
}

cardcounting