From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 00/17] ASoC: tegra: Add Tegra30 support
Date: Fri, 30 Mar 2012 17:07:15 -0600
Message-ID: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This series adds basic support for 16-bit stereo on Tegra30. This will
be enabled for the Cardhu board in a separate series to arch/arm/mach-tegra.

I don't believe this depends on anything that won't be in 3.4. The related
arch/arm/mach-tegra series will have some dependencies.

There are a couple patches in here which also touch arch/arm/mach-tegra.
I believe it should be fine to apply these to the ASoC tree without issue
(I don't anticpate conflicts) but as you (Mark) mentioned, putting them
into a separate branch just in case might be a good idea.

Stephen Warren (17):
  ASoC: tegra: remove open-coded clk reference counting
  ASoC: tegra: ensure clocks are enabled when touching registers
  ASoC: tegra: remove unnecessary includes
  ASoC: tegra: add description to a couple Kconfig options
  ASoC: tegra: fix Kconfig SND_SOC_TEGRA_ALC5632 indentation
  ASoC: tegra: fix some checkpatch warnings
  ASoC: tegra: introduce separate Kconfig variable for DAS driver
  ASoC: tegra: make Tegra20 drivers depend on Tegra20 support
  ASoC: tegra: sort Makefile into common and per-SoC files
  ASoC: tegra: rename Tegra20-specific driver files
  ASoC: tegra: complete Tegra->Tegra20 renaming
  ASoC: tegra: utils: add support for Tegra30 devices
  ASoC: tegra: set a sensible initial clock rate
  ASoC: tegra: add tegra30-ahub driver
  ASoC: tegra: add tegra30-i2s driver
  ASoC: tegra: add Kconfig and Makefile support for Tegra30
  ASoC: tegra+wm8903 machine: support Tegra30

 .../bindings/sound/tegra-audio-wm8903.txt          |    8 +-
 .../devicetree/bindings/sound/tegra30-ahub.txt     |   18 +
 .../devicetree/bindings/sound/tegra30-i2s.txt      |   12 +
 arch/arm/mach-tegra/board-dt-tegra20.c             |    6 +-
 arch/arm/mach-tegra/devices.c                      |    6 +-
 arch/arm/mach-tegra/tegra2_clocks.c                |    4 +-
 sound/soc/tegra/Kconfig                            |   61 ++-
 sound/soc/tegra/Makefile                           |   18 +-
 sound/soc/tegra/tegra20_das.c                      |  261 +++++++++
 sound/soc/tegra/tegra20_das.h                      |  135 +++++
 sound/soc/tegra/tegra20_i2s.c                      |  462 +++++++++++++++
 sound/soc/tegra/tegra20_i2s.h                      |  165 ++++++
 sound/soc/tegra/tegra20_spdif.c                    |  369 ++++++++++++
 sound/soc/tegra/tegra20_spdif.h                    |  472 ++++++++++++++++
 sound/soc/tegra/tegra30_ahub.c                     |  593 ++++++++++++++++++++
 sound/soc/tegra/tegra30_ahub.h                     |  489 ++++++++++++++++
 sound/soc/tegra/tegra30_i2s.c                      |  538 ++++++++++++++++++
 sound/soc/tegra/tegra30_i2s.h                      |  242 ++++++++
 sound/soc/tegra/tegra_alc5632.c                    |    6 +-
 sound/soc/tegra/tegra_asoc_utils.c                 |   35 +-
 sound/soc/tegra/tegra_asoc_utils.h                 |   10 +-
 sound/soc/tegra/tegra_das.c                        |  261 ---------
 sound/soc/tegra/tegra_das.h                        |  135 -----
 sound/soc/tegra/tegra_i2s.c                        |  464 ---------------
 sound/soc/tegra/tegra_i2s.h                        |  166 ------
 sound/soc/tegra/tegra_spdif.c                      |  369 ------------
 sound/soc/tegra/tegra_spdif.h                      |  473 ----------------
 sound/soc/tegra/tegra_wm8903.c                     |   39 +-
 sound/soc/tegra/trimslice.c                        |   10 +-
 29 files changed, 3896 insertions(+), 1931 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/tegra30-ahub.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tegra30-i2s.txt
 create mode 100644 sound/soc/tegra/tegra20_das.c
 create mode 100644 sound/soc/tegra/tegra20_das.h
 create mode 100644 sound/soc/tegra/tegra20_i2s.c
 create mode 100644 sound/soc/tegra/tegra20_i2s.h
 create mode 100644 sound/soc/tegra/tegra20_spdif.c
 create mode 100644 sound/soc/tegra/tegra20_spdif.h
 create mode 100644 sound/soc/tegra/tegra30_ahub.c
 create mode 100644 sound/soc/tegra/tegra30_ahub.h
 create mode 100644 sound/soc/tegra/tegra30_i2s.c
 create mode 100644 sound/soc/tegra/tegra30_i2s.h
 delete mode 100644 sound/soc/tegra/tegra_das.c
 delete mode 100644 sound/soc/tegra/tegra_das.h
 delete mode 100644 sound/soc/tegra/tegra_i2s.c
 delete mode 100644 sound/soc/tegra/tegra_i2s.h
 delete mode 100644 sound/soc/tegra/tegra_spdif.c
 delete mode 100644 sound/soc/tegra/tegra_spdif.h
