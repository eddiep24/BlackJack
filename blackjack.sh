#!/bin/bash

arr=(0 0 0 0 0 0 0 0)
runningSum=0




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
    printf "|    17     | S | S | S | S | S | S | S | S | S | RS|\n\n"
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

function printBlackjack() {
    case ${arr[0]} in
        1)
            printf "Dealer: A\n"
            ;;
        11)
            printf "Dealer: J\n"
            ;;
        12)
            printf "Dealer: Q\n"
            ;;
        13)
            printf "Dealer: K\n"
            ;;
        *)
            printf "Dealer: ${arr[0]}\n"
            ;;
    esac
    printf "You: "
    tempCount=1
    while [[ ${arr[$tempCount]} != 0 ]]; do
        case ${arr[$tempCount]} in
        1)
            printf "A "
            ;;
        11)
            printf "J "
            ;;
        12)
            printf "Q "
            ;;
        13)
            printf "K "
            ;;
        *)
            printf "${arr[$tempCount]} "
            ;;
        esac
        
        tempCount=$((tempCount+1))
    done
    printf "\n"
    printf "hit (h), stay (s), double (d), split (p), exit (e)\n"
}


function blackjack() {
    done=$false
    count=1
    arr[0]=$(shuf -i 1-13 -n1)
    arr[0]=1 #THIS LINE IS FOR TESTING
    while [[ $done != true ]] ; do
        cur=$(shuf -i 1-13 -n1)

        if [ $ace ] || [ $cur -eq 1 ]; then 
            ace=$true
        else
            ace=$false
        fi

        arr[$count]=$cur
        printBlackjack
        runningSum+=$cur
        read response
        if [[ $response = e ]]; then
            exit 0
        fi

        # Logic for Basic Strategy Implementation
        # Start with what the dealer card is
        correctSol=false
        case ${arr[0]} in
        1)
            # Hard Total (TODO check for ace)
            if [[ $response = 'h' && !($ace) ]]; then
                if [[ $runningSum = 5 || $runningSum = 6 || $runningSum = 7 || $runningSum = 8 || $runningSum = 9 || $runningSum = 10 || $runningSum = 12 || $runningSum = 13 || $runningSum = 14 ]]; then
                    correctSol=true
                fi
            fi

            ;;
        2)
            correctSol=true
            ;;
        3)
            correctSol=true
            ;;
        4)
            correctSol=true
            ;;
        5)
            correctSol=true
            ;;
        6)
            correctSol=true
            ;;
        7)
            correctSol=true
            ;;
        8)
            correctSol=true
            ;;
        9)
            correctSol=true
            ;;
        *) 
            correctSol=true
            ;;
        esac
        echo $correctSol
        #########################################
        if [ $correctSol -eq $false ]; then
            printf "Incorrect Solution. Play again (a), Menu (m), or Exit (e)\n"
            read r
            case $r in
            "a") # Possibly restart all variables in the future here
                blackjack
                ;;
            "m")
                main
                ;;
            *)
                exit 0
                ;;
            esac
        fi
        count=$((count+1))
    done 

    # reset arr
    for i in {0..$count}; do
        arr[$i]=0
    done
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
        printf "\n[1] for Basic Strategy Cheat Sheet\n"
        printf "[2] for Blackjack practice\n"
        printf "[3] for practice counting cards\n"
        echo "[4] exit\n"
        read input
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

blackjack