# rnnoise-phl-plugin

This repo hosts the source code of the implementation of library `rnnoise` using a custom openMHA plugin -- `rnnoise`.

This repo also contains a docker file to create the container.

Follow these steps to create an image and run an example.

- `docker build --tag rnnoise-plugin .`
- `docker run -i -t rnnoise-plugin /bin/bash`

Upon getting `#` prompt

- `cd /home/openMHA/examples/32-rnnoise/`
- `mha --interactive`
- `?read:rnnoise.cfg`
- `cmd=start`
- `cmd=quit`

You can see the processed file ready after these steps.

## Current limitations

- This plugin uses `librnnoise` and hence can only process audio files with 44100 Hz sampling rate.
- The plugin processes 480 frames at a time due limitation of this library.


