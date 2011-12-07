From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/8] arm/tegra: Device tree support for audio
Date: Wed,  7 Dec 2011 15:13:39 -0700
Message-ID: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series shouldn't be considered final until the relevant ASoC
changes are accepted, since the documentation and implementation of most
of the DT bindings are in those ASoC patches and this series just puts
those bindings into use.

Still, I figured I should post them all for early review.

The one binding that's actually defined here is that for the APB DMA
engine.

For the record, this series depends on at least the following for context
and to merge and compile:

series ending: arm/dt: tegra: Fix SDHCI nodes to match board files
arm/tegra: convert tegra20 to GIC devicetree binding
arm/tegra: Remove use of TEGRA_GPIO_TO_IRQ
gpio/tegra: Dynamically allocate IRQ base, and support DT

... and all the patches I've posted to the ASoC list in order to actually
enable the audio card through DT at run-time.

Stephen Warren (8):
  arm/tegra: board-dt: Fix AUXDATA typo
  arm/tegra: board-dt: Enable audio-related clocks
  arm/tegra: Split Seaboard GPIO table to allow for Ventana
  arm/dt: tegra: Add Tegra APB DMA device tree binding
  arm/dt: tegra: Clean up I2S and DAS nodes
  arm/dt: tegra: Modify I2S nodes to match binding
  arm/dt: tegra: Add labels for I2S controllers
  arm/dt: tegra: Enable audio on WM8903 boards, disable others

 .../devicetree/bindings/dma/tegra20-apbdma.txt     |   29 +++++++++++++
 arch/arm/boot/dts/tegra-harmony.dts                |   42 +++++++++++++++-----
 arch/arm/boot/dts/tegra-paz00.dts                  |   12 +++++
 arch/arm/boot/dts/tegra-seaboard.dts               |   41 +++++++++++++++++++
 arch/arm/boot/dts/tegra-trimslice.dts              |   12 +++++
 arch/arm/boot/dts/tegra-ventana.dts                |   43 ++++++++++++++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |   35 +++++++++++-----
 arch/arm/mach-tegra/board-dt.c                     |    7 +++-
 arch/arm/mach-tegra/board-seaboard-pinmux.c        |   16 +++++++-
 9 files changed, 215 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
