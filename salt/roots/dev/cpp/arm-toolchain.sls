# Arm toolchain repository
arm-toolchain:
  # Package repository
  pkgrepo.managed:
    - ppa: team-gcc-arm-embedded/ppa
    - require_in:
      - pkg: gcc-arm-embedded

gcc-arm-embedded:
  pkg.installed

dfu-util:
    pkg.installed

git://git.code.sf.net/p/openocd/code:
  git.latest:
    - rev: v0.9.0
    - target: /usr/src/openocd
    - user: root
    - require:
      - pkg: git

openocd:
  cmd.run:
    - cwd: /usr/src/openocd
    - user: root
    - name: |
        ./bootstrap
        ./configure --prefix=/usr/local
        make
        make install
    - creates: /usr/local/bin/openocd
    - require:
        - pkg: libtool
        - pkg: automake
        - pkg: autoconf

/etc/udev/rules.d/90-openocd.rules:
  file.managed:
    - source: /usr/src/openocd/contrib/99-openocd.rules
    - mode: 644
