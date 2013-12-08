# Luzifer/livecast

## Using vagrant

    git clone git://github.com/Luzifer/livecast.git
    cd livecast
    git submodule update --init --recursive
    vagrant up

## Using masterless puppet

    git clone git://github.com/Luzifer/livecast.git
    cd livecast
    git submodule update --init --recursive
    puppet apply manifests/site.pp

