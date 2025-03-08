# See available `just` subcommands
list:
    just --list

# Create scaffolding and hugo.toml
init:
    hugo new site . --force

# Serve website on http://127.0.0.1:1313/
serve:
    hugo serve -D

# Create new post in content/posts/
post MDFILE:
    mkdir -p content/posts
    hugo new content 'content/posts/{{ MDFILE }}' || true

# Deploy to DIR on SERVER using tar/ssh/scp
deploy SERVER='feng' DIR='/var/www/datamatik.blog':
    hugo
    tar cfz public.tgz public/
    scp public.tgz {{ SERVER }}:{{ DIR }}
    ssh {{ SERVER }} 'cd {{ DIR }} && tar xfz public.tgz'
