#!/usr/bin/env sh

# Pacman knowledge mini-quiz created for fun

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

numOfQuestions=0
correctCount=0

declare -A qna0=(
    [question]='Install firefox package'
    [correctAnswer]='pacman -S firefox'
)
declare -A qna1=(
    [question]='Remove firefox package'
    [correctAnswer]='pacman -R firefox'
)
declare -A qna2=(
    [question]='Search for firefox package'
    [correctAnswer]='pacman -Ss firefox'
)
declare -A qna3=(
    [question]='Update the system'
    [correctAnswer]='pacman -Syu'
)
declare -A qna4=(
    [question]='List explictly installed packages'
    [correctAnswer]='pacman -Qe'
)
declare -A qna5=(
    [question]='List unneeded packages'
    [correctAnswer]='pacman -Qdt'
)

echo -e "\n\U1F4BB Test your pamac knowledge by typing commands. \nFor each quiz question, you must enter the correct command. After the quiz is completed the result will be displayed. \nTo start the quiz type "start" and then press enter. Otherwise, the execution will be terminated.\n"
read -p "Type start and press enter: " START
if [ "$START" = "start" ]; then
	clear
    declare -n qna
    for qna in ${!qna@}; do
    ((numOfQuestions=$numOfQuestions+1))
    echo -e "\nQuestion $numOfQuestions"
    read -p "${qna[question]}: " answer
    if [[ $answer == ${qna[correctAnswer]} ]]
    then
        ((correctCount=$correctCount+1))
        echo -e "${GREEN}Correct!${NOCOLOR}"
    else
        echo -e "${RED}False.${NOCOLOR} The correct answer was \e[4m${qna[correctAnswer]}\e[0m"
    fi
done
else
    echo -ne '\nG                     \r'
    sleep 0.2
    echo -ne 'Go                    \r'
    sleep 0.2
    echo -ne 'Goo                   \r'
    sleep 0.2
    echo -ne 'Good                  \r'
    sleep 0.2
    echo -ne 'Good                  \r'
    sleep 0.2
    echo -ne 'Good B                \r'
    sleep 0.2
    echo -ne 'Good By               \r'
    sleep 0.2
    echo -ne 'Good Bye              \r'
    sleep 0.2
    echo -ne 'Good Bye!             \r'
    sleep 0.2
    echo -ne '\n\n'
    sleep 0.2
    exit 1
fi

successMessage="successMessage"

score=$((100*$correctCount/$numOfQuestions))

score() {
    if [[ $score -eq 100 ]]
    then
        successMessage="Congratulation \U1F603"
    elif [[ $score -lt 100 ]] && [[ $score -gt 79 ]]
    then
        successMessage="Very good \U1F642"
    elif [[ $score -lt 80 ]] && [[ $score -gt 59 ]]
    then
        successMessage="Good \U1F644"
    elif [[ $score -lt 60 ]] && [[ $score -gt 40 ]]
    then
        successMessage="You need more practice \U1F610"
    else
        successMessage="Very Bad \U1F625"
    fi
}

print() {
    score
    echo -e "\nScore: $score% \nResult: $successMessage \n\nNumber of questions: $numOfQuestions \nNumber of correct answers: $correctCount \n"
}

print
