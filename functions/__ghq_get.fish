function __ghq_get
    if type -q ghq
        if test (count $argv) = 1
          if test (echo $argv[1] | grep -o "/" | wc -l | tr -d " ") = "2"
                set -l __repository (echo $argv[1] | cut -d"/" -f 2-)
                set -l __hub (echo $argv[1] | cut -d"/" -f 1)
                if test $__hub = "bb"
                      ghq get git@bitbucket.org:$__repository.git
                end
                if test $__hub = "gl"
                      ghq get git@gitlab.com:$__repository.git
                end
          else
                ghq get -p $argv[1]
          end
       end
   end
end
