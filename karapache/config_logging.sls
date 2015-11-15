{% from "apache/map.jinja" import apache with context %}

include:
  - apache

install_cronolog:
  pkg.installed:
    - name: cronolog

base_logging_config:
  file.managed:
    - group: root
    - mode: 644
    - name: {{ apache.confdir }}/base_logging.conf
    - require:
      - pkg: apache
    - source: salt://karapache/files/base_logging.conf.jinja
    - template: jinja
    - watch_in:
      - module: apache-restart
    - user: root      
    