

DockerFile for scientific python packages
=========================================

Dockerfile base for fast installs of scientific python packages related to the field computer vision.

.. code-block::

  FROM digitalbridge/scientificpython:latest
  CMD [ "python", "./your-daemon-or-script.py" ]

See https://hub.docker.com/r/digitalbridge/scientificpython/