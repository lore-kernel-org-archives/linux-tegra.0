From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/17] ASoC: Add Tegra DT, cleanup, and related
Date: Tue, 22 Nov 2011 18:21:08 -0700
Message-ID: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

These patches add device tree bindings for all the Tegra ASoC components,
and the WM8903 codec. Also included is some general Tegra driver cleanup,
and a solution for the "snd_soc_dapm_nc_pin" open-coding.

The ASoC and arch/arm changes should be independent enought that they can
be applied to their separate trees without issue to those trees standalone,
and will meet in linux-next just fine.

The arch/arm .dts/*.dts changes depend on the .dtsi/.dts cleanup patches
that I posted yesterday for context.

I tested this on:

Harmony, Seaboard: non-DT and DT: Tested audio capture & playback.

Trimslice: non-DT and DT: Tested audio playback. Capture appears to be
broken before my patches.

Ventana: DT: Tested audio capture & playback.

Paz00: DT: Tested booting with the patches applied.

John Bonesio (2):
  ASoC: Add device tree binding for WM8903
  ASoC: Tegra+WM8903 machine: Add device tree binding

Stephen Warren (15):
  arm/tegra: board-dt: audio: Enable clocks, fix AUXDATA
  arm/dt: Tegra: Clean up I2S and DAS nodes
  arm/dt: Tegra: Enable audio on WM8903 boards, disable others
  ASoC: Tegra: Move DAS configuration into machine drivers
  ASoC: Tegra PCM: Use module_platform_driver
  ASoC: Tegra DAS: Use devm_ APIs and module_platform_driver
  ASoC: Tegra I2S: Use devm_ APIs and module_platform_driver
  ASoC: Tegra I2S: Remove dependency on pdev->id
  ASoC: Tegra DAS: Add device tree binding
  ASoC: Tegra I2S: Add device tree binding
  ASoC: Tegra+WM8903 machine: Use devm_ APIs and module_platform_driver
  ASoC: Tegra TrimSlice machine: Use devm_ APIs and
    module_platform_driver
  ASoC: Implement "auto nc pins" feature
  ASoC: Tegra+WM903 machine: Use new auto_nc_codec_pins feature
  ASoC: TrimSlice machine: Use new auto_nc_codec_pins feature

 .../bindings/sound/tegra-audio-wm8903.txt          |   63 +++++++
 .../devicetree/bindings/sound/tegra20-das.txt      |   12 ++
 .../devicetree/bindings/sound/tegra20-i2s.txt      |   16 ++
 Documentation/devicetree/bindings/sound/wm8903.txt |   48 +++++
 arch/arm/boot/dts/tegra-harmony.dts                |   29 +++-
 arch/arm/boot/dts/tegra-paz00.dts                  |   12 ++
 arch/arm/boot/dts/tegra-seaboard.dts               |   36 ++++
 arch/arm/boot/dts/tegra-trimslice.dts              |   12 ++
 arch/arm/boot/dts/tegra-ventana.dts                |   38 ++++
 arch/arm/boot/dts/tegra20.dtsi                     |   10 +-
 arch/arm/mach-tegra/board-dt.c                     |    7 +-
 include/sound/soc-dapm.h                           |    1 +
 include/sound/soc.h                                |    1 +
 sound/soc/codecs/wm8903.c                          |   48 +++++-
 sound/soc/soc-core.c                               |    4 +
 sound/soc/soc-dapm.c                               |   73 ++++++++
 sound/soc/tegra/tegra_das.c                        |   53 ++----
 sound/soc/tegra/tegra_i2s.c                        |  164 ++++++-----------
 sound/soc/tegra/tegra_i2s.h                        |    1 +
 sound/soc/tegra/tegra_pcm.c                        |   13 +--
 sound/soc/tegra/tegra_wm8903.c                     |  193 +++++++++++++-------
 sound/soc/tegra/trimslice.c                        |   45 +++---
 22 files changed, 620 insertions(+), 259 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/tegra-audio-wm8903.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tegra20-das.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/wm8903.txt
