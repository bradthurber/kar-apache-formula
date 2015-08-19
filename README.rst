================
kar-apache-formula
================

A pseudo-salt formula that extends the public salt apache formula 
https://github.com/saltstack-formulas/apache-formula with pieces
that are KAR specific.

At the moment, this pseudo-formula has no map.jina and no init.sls instead
relying on the extended apache formula

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

All other states (unless otherwise mentioned) are meant to be run on any/all jbosseap servers
	
Available states
================

.. contents::
    :local:

``karapache.config_logging``
------------

Configures logging in the KAR way: Installs cronolog, and creates symlinks to re-route
logs to a shared nas volume

``karapache.auditor_happiness``
------------

Does some additional configuration to the apache server to keep auditors happy

