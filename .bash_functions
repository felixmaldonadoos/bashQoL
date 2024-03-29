## functions I use in my Ubuntu WSL env

# open research folder 
cdr(){
    local windows_user=$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')
    cd ~ && cd /mnt/c/Users/${windows_user}/Research/
}

# open cellworld vr folder
cdcwvr() {
    cdr
    cd cellworld_vr/
}

# open cellworld utils (server) folder 
cdcwu(){
    cdr 
    cd cellworld_utils/
}

# start cellworld VR python server
cwserver(){
    cwu
    if [ -f "activate.sh" ]; then
        source activate.sh
    else
        echo "activate.sh not found"
	return 1
    fi
    cd src/
    python3 Server.py
}

