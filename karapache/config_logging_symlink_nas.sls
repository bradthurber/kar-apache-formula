{% from "apache/map.jinja" import apache with context %}

include:
  - apache

sym_link_apache_httpd_logs_to_mnt_logs:
  file.symlink:
    - name: {{ apache.logdir }}
    - target: /mnt/logs
    - backupname: /var/log/httpd.backup
    