function upgrade-packages
    # Ask for the administrator password upfront
    sudo -v

    command --search softwareupdate >/dev/null; and begin
        echo "Updating macOS"
        sudo softwareupdate -i -a
    end

    command --search mas >/dev/null; and begin
        echo "Updating Mac App Store"
        mas upgrade
    end

    command --search brew >/dev/null; and begin
        echo "Updating brew"
        brew update
        brew upgrade
        brew cleanup
    end

    command --search yarn >/dev/null; and begin
        echo "Updating yarn"
        yarn global upgrade
    end

    # TODO: RubyGems
    # command --search gem >/dev/null; and begin
    #     sudo -v
    #     echo "Updating gem/ruby"
    #     sudo gem update --system
    #     gem update
    #     gem cleanup
    # end

    command --search pipx >/dev/null; and begin
        echo "Updating pipx"
        pipx upgrade-all
    end

    command --search go >/dev/null; and begin
        echo "Updating go"
        $HOME/git/dotfiles/go.sh
    end


    command --search go >/dev/null; and begin
        echo "Updating poetry"
        poetry self update
    end

end
