set -g -x fish_greeting ''
alias vim "nvim"
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

set -gx PATH /home/jstimpson/bin $PATH
set -gx PATH /home/jstimpson/Android/Sdk/platform-tools $PATH
set -gx PATH /home/jstimpson/.cargo/bin $PATH
set -gx EDITOR /usr/bin/nvim
set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x ARDUINO_PATH /usr/local/arduino
set -x QHOME /home/jstimpson/dev/q/q

function log_search
    set pat "$argv[1]"
    set terms $argv[2..-1]
    set files (ls -t ~/.logs/$pat*) 
    for f in $files
        echo $f $terms
    end
end

function consult
    set file "$argv[1]"
    erl -hidden -noshell -eval "io:format(\"~p~n\", [file:consult(\"$file\")]), halt()."
end

function q
    rlwrap /home/jstimpson/dev/q/q/l32/q
end

#. ~/.venv/sre/bin/activate.fish
