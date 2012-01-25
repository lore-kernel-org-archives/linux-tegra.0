From: Leon Romanovsky <leon@leon.nu>
Subject: [PATCH 0/3] Add device tree support of audio (ALC5632) on PAZ00 board and enable headphones autodetection.
Date: Wed, 25 Jan 2012 20:48:56 +0200
Message-ID: <1327517336-29662-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rdunlap@xenotime.net, lrg@ti.com, broonie@opensource.wolfsonmicro.com, swarren@nvidia.com, olof@lixom.net, ccross@android.com
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Leon Romanovsky <leon@leon.nu>
List-Id: linux-tegra@vger.kernel.org


The following patchset is going to add device tree support of audio (ALC5632) on 
PAZ00 board and enable headphones autodetection.

Leon Romanovsky (3):
  ARM: dt: tegra: Enable device tree audio on PAZ00 board.
  ARM: tegra: Enable the headphone detection gpio on PAZ00 board.
  ASoC: dt: tegra: Enable headphone autodetection on PAZ00 board.

 .../devicetree/bindings/sound/alc5632.txt          |   24 ++++
 .../bindings/sound/tegra-audio-alc5632.txt         |   55 ++++++++++
 arch/arm/boot/dts/tegra-paz00.dts                  |   30 ++++-
 arch/arm/mach-tegra/board-paz00-pinmux.c           |    1 +
 arch/arm/mach-tegra/board-paz00.h                  |    3 +
 sound/soc/tegra/tegra_alc5632.c                    |  114 ++++++++++++++++++--
 6 files changed, 212 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/alc5632.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tegra-audio-alc5632.txt

-- 
1.7.3.4

