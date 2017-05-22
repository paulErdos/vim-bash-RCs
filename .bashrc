alias ls='pwd; ls -alh'

# Here's how you make functions!
myFunction() {
    echo "Hello, world!"
}

# Functions can take arguments thusly, also this is useful. 
cc() {
    clear;
    cd $1;
    ls;
}
