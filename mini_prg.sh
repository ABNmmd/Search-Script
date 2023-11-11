#!/bin/bash

search_startAt=$1
target_name=""
target_type=""


for arg in "$@" ;
do

    if [[ "$arg" == "-name" ]];
    then
        # Prend le nom à partir du prochain argument.
        target_name="${3:-}"
        shift 2
    fi

    if [[ "$arg" == "-type" ]];
    then
        # Prend le type à partir du prochain argument.
        target_type="${3:-}"
        shift 2
    fi

done

# Vérifie si le nom et le type sont vides.
# Si c'est le cas, affiche un message d'utilisation et quitte.
if [ -z "$target_name" ] && [ -z "$target_type" ]; then
    echo "Usage: $0 <search_startAt> [ -name <target_name> OR -type <target_type> ]"
    exit 1
fi

# Vérifie si le répertoire de départ n'est pas vide.
# Si c'est le cas, affiche un message d'erreur indiquant que le répertoire n'existe pas et quitte.
if [[ -n "$search_startAt" ]] && [ ! -d "$search_startAt" ];
then
    echo "The directory '$search_startAt' does not exist."
    exit 1
fi

# verifier que le type est f ou d.
if [[ -n "$target_type" ]] && [ "$target_type" != "d" ] && [ "$target_type" != "f" ];
then
    echo "Invalid type. Use 'f' for files or 'd' for directories."
    exit 1
fi

# La fonction à exécuter si le seul argument existant est -name.
function search_by_name {

    for file in "$1"/*;
    do
        if [[ "$file" == *"$1/$2"* ]];
        then
            output+=("$file")
        fi

        if [ -d "$file" ];
        then
            search_by_name "$file" "$2"
        fi
    done

}

# La fonction à exécuter si le seul argument existant est -type.
function search_by_type {
    for file in "$1"/*;
    do
        if [ "$2" == "f" ] && [ -f "$file" ];
        then
            output+=("$file")
        elif [ "$2" == "d" ] && [ -d "$file" ];
        then
            output+=("$file")
        fi

        if [ -d "$file" ];
        then
            search_by_type "$file" "$2"
        fi
    done
}

# La fonction à exécuter si les deux arguments existent.
function search_by_both {
    for file in "$1"/*;
    do
    
        if [ "$3" == "f" ] && [ -f "$file" ] && [[ "$file" == *"$1/$2"* ]];
        then
            output+=("$file")
        elif [ "$3" == "d" ] && [ -d "$file" ] && [[ "$file" == *"$1/$2"* ]];
        then
            output+=("$file")
        fi

        if [ -d "$file" ];
        then
            search_by_both "$file" "$2" "$3"
        fi
        
    done
}




    

    

function search_for_thetarget {
    local output=()


    if [[ -n $2 ]] && [[ -z $3 ]];
    then
        search_by_name "$1" "$2"
    elif [[ -z $2 ]] && [[ -n $3 ]];
    then
        search_by_type "$1" "$3"
    elif [[ -n $2 ]] && [[ -n $3 ]];
    then
        search_by_both "$1" "$2" "$3"
    fi


    if [ ${#output[@]} -eq 0 ];
    then
        echo "Not found"
    else
        for res in "${output[@]}";
        do
            echo "$res"
        done
    fi
    unset output
}

search_for_thetarget "$search_startAt" "$target_name" "$target_type"