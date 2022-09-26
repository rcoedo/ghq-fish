function __ghq_get
    if type -q ghq
        argparse --name=__ghq_get 'u/user=' 'h/hub=' 'd/dry' -- $argv
        or return

        set -q _flag_user && set -l identity "-$_flag_user"
        set -q _flag_hub || set -l _flag_hub "gh"
        set -l hub (switch $_flag_hub
                    case "gh"
                        echo github.com
                    case "bb"
                        echo "bitbucket.org"
                    case "gl"
                        echo "gitlab.com"
                  end)
        set -l url "git@$hub$identity:$argv.git"

        if set -q _flag_dry
            echo $url
        else
            git clone $url $GHQ_ROOT/$hub/$argv
        end
   end
end
