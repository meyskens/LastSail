# LastSail
LastSail is a python-based LastPass client for SailFish OS. It uses the [konomae's LastPass library](https://github.com/konomae/lastpass-python).

## Dependancies
Currently you need to have to install the Python library by hand for this app to work. I hope to vendor it in in the future.
```bash
$ devel-su
# pkcon install gcc
# pip3 install lastpass-python
```

## State of the project
The app currently only is able to login and display entries. (aka far from useful)

## To Do (PR's welcome!)
- [ ] Add detail view
- [ ] Add search
- [ ] Add login check on canceled login
- [ ] Store session key in device
- [ ] Add offline option
- [ ] Add editing (currenly not supported in any Library I can find)
