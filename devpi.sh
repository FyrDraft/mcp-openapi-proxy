

ssh -L 3141:localhost:3141 azdev5 -N -f    # ssh to azdev5, forwarding only

devpi use http://localhost:3141/root/fyrdraft
devpi login root --password=$(op item get "devpi Password" --field password --reveal)
