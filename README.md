# rnnoise-phl-plugin

This repo hosts source code of implementation of library `rnnoise` using custom openMHA plugin called `rnnoise`.

This repo also contains docker file to create the container.

Follow these steps in order to create an image and run an example.

- `docker build --tag rnnoise-plugin .`
- `docker run -i -t rnnoise-plugin /bin/bash`

Upon getting `#` prompt

- `cd /home/openMHA/examples/`
- `mha --interactive`
- `?read:rnnoise.cfg`
- `cmd=start`
- `cmd=quit`

You can see processed file ready after these steps.

## Current limitations

- This plugin uses `librnnoise` and hence can only process audio files with 44100 Hz sampling rate.
- Plugin processes 480 frames at a time due limitation of this library.


