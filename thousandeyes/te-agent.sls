{% import_yaml "thousandeyes/te-agent.conf.yml" as config %}
{%- set OS = grains['os'] -%}
{%- set CODENAME = grains['oscodename'] -%}
{%- set MRELEASE = grains['osmajorrelease'] -%}
{%- set ARCH = grains['osarch'] -%}
{%- set PACKET_STATE = ('installed','purged','removed') %}
{%- set REPO_STATE = ('managed','absent') %}
{%- if OS == 'CentOS' and MRELEASE|int < 7 -%}
  {#- note: This handles issue with init system on CentOS < 7 versions.
  -#}
  {%- set INIT = 'rh_service' -%}
{%- else -%}
  {%- set INIT = grains['init'] -%}
{%- endif -%}

te-agent:
  {% if config.set_repo|default('managed') in REPO_STATE %}
  pkgrepo.{{config.set_repo|default('managed')}}:
    {%- if OS == 'RedHat' or OS == 'CentOS' and MRELEASE|int >= 6 %}
      - baseurl: http://yum.thousandeyes.com/{{ OS }}/{{ MRELEASE }}/{{ ARCH }}
      - gpgkey: http://yum.thousandeyes.com/RPM-GPG-KEY-thousandeyes
      - gpgcheck: 1
    {%- elif OS == 'Ubuntu' and CODENAME == 'xenial' or CODENAME == 'trusty' %}
      - name: deb http://apt.thousandeyes.com {{ CODENAME }} main
      - keyid: BE718900
      - keyserver: http://apt.thousandeyes.com/thousandeyes-apt-key.pub
    {% else %}
      {{ salt.test.exception("Only Ubuntu 14.04 (trusty), 16.04 (xenial), CentOS 6.3 or newer are supported. Please contact support") }}
    {% endif %}
  {% endif -%}
  {% if config.te_agent|default('installed') in PACKET_STATE %}
  pkg.{{config.te_agent|default('installed')}}:
    - name: te-agent
  {% if config.te_agent|default('installed') == 'installed' %}
  file.managed:
    - name: /etc/te-agent.cfg
    - source: salt://thousandeyes/te-agent.conf.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
      {% for key, value in config.items() -%}
        {{key}}: {{value}}
      {% endfor %}
  service.running:
    - enable: True
    - provider: {{ INIT }}
  {% endif -%}
  {% endif -%}

{% if config.browserbot is defined and config.browserbot in PACKET_STATE %}
te-browserbot:
  pkg.{{config.browserbot}}:
    - name: te-browserbot
  {%- if config.browserbot == 'installed' %}
  service.running:
    - enable: True
    - provider: {{ INIT }}
  {% endif -%}
{% endif -%}

{% if config.agent_utils is defined and config.agent_utils in PACKET_STATE %}
te-agent-utils:
  pkg.{{config.agent_utils}}:
    - name: te-agent-utils
{% endif -%}

{% if config.international_langs is defined and config.international_langs in PACKET_STATE %}
te-intl-fonts:
  pkg.{{config.international_langs}}:
    - name: te-intl-fonts
{% endif -%}
