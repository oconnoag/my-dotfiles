# Enter into an docker container 
enter_container() {
    docker exec -it $1 /bin/bash
}
