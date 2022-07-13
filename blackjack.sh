#!/bin/bash

function welcome() {
    clear
    printf "__________.__                 __        ____.              __\n"
    printf "\______   \\  | _____    ____ |  | __   |    |____    ____ |  | __\n"
    printf " |    |  _/  | \\__  \\ _/ ___\\|  |/ /   |    \\__  \\ _/ ___\\|  |/ /\n"
    printf " |    |   \\  |__/ __ \\\\   \\___|    </\\__|    |/ __ \\\\  \\____|    < \n"
    printf " |______  /____(____  /\\___  >__|_ \\________(____  /\\___  >__|_ \\ \n"
    printf "        \\/          \\/     \\/     \\/             \\/     \\/     \\/\n";
    printf "by Eddie Phillips\n"
}

function basic_strategy() {
    clear

    printf "|Hard Total |              Dealer Upcard            |\n"
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
    printf "|   A,9     | S | S | S | S | S | S | S | S | S | S |\n"
}

function blackjack() {

}

welcome
