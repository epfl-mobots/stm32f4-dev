epfl:
  user.present:
    - fullname: Student
    - home: /home/epfl
    - shell: /usr/bin/fish
    # Default password is "epfl"
    # was generated using python2 -c "import crypt; print
    # crypt.crypt('epfl', '\$6\$SALTsalt\$')"
    - password: $6$SALTsalt$ao3Lv6fUB4uolDKPS2h8s7FB6MGFLJ6aqQ9tUItOOI5qCrYqmXuL0UB00gVlnPaVr8yr8KszmNDfEgmTEuItN/
    - groups:
       - sudo
       - plugdev
       - dialout
