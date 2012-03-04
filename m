From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL 2/6] ARM: tegra: device tree updates
Date: Sun,  4 Mar 2012 12:13:58 -0800
Message-ID: <1330892042-32065-3-git-send-email-olof@lixom.net>
References: <1330892042-32065-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330892042-32065-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following changes since commit 62aa2b537c6f5957afd98e29f96897419ed5ebab:

  Linux 3.3-rc2 (2012-01-31 13:31:54 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git tags/tegra-dt

for you to fetch changes up to 96d6714ca27acab087dcc8d75a7ec815abe3dde7:

  ASoC: DT: Add digital microphone binding to PAZ00 board. (2012-03-04 10:42:16 -0800)

----------------------------------------------------------------
Device tree updates for tegra. Various development, including a handful of
additions to the tegra30 device trees.

----------------------------------------------------------------
Leon Romanovsky (3):
      ARM: dt: tegra: Enable device tree audio codec on PAZ00 board.
      ARM: dt: tegra: Enable headset autodetection on PAZ00 board.
      ASoC: DT: Add digital microphone binding to PAZ00 board.

Olof Johansson (2):
      ARM: tegra: emc: device tree bindings
      ARM: tegra: seaboard: add EMC table to device tree

Stephen Warren (10):
      dt: tegra gpio: Flesh out binding documentation
      ARM: dt: tegra30.dtsi: Reformat gpio's interrupts property
      ARM: dt: tegra30.dtsi: Add extra GPIO interrupt
      ARM: dt: tegra: Add Tegra APB DMA device tree binding
      ARM: dt: tegra: Modify I2S nodes to match binding
      ARM: dt: tegra: Add labels for I2S controllers
      ARM: dt: tegra: Enable audio on WM8903 boards, disable others
      ARM: dt: Add binding for Tegra PMC
      ARM: dt: Add SD controller configuration to Tegra Cardhu
      ARM: dt: Add ARM PMU to tegra*.dtsi

 .../devicetree/bindings/arm/tegra/emc.txt          |  100 ++++++++++++++++++++
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |   19 ++++
 .../devicetree/bindings/dma/tegra20-apbdma.txt     |   30 ++++++
 .../devicetree/bindings/gpio/gpio_nvidia.txt       |   18 ++++
 arch/arm/boot/dts/tegra-cardhu.dts                 |   18 ++++
 arch/arm/boot/dts/tegra-harmony.dts                |   45 +++++++--
 arch/arm/boot/dts/tegra-paz00.dts                  |   31 ++++++
 arch/arm/boot/dts/tegra-seaboard.dts               |   78 +++++++++++++++
 arch/arm/boot/dts/tegra-trimslice.dts              |   12 +++
 arch/arm/boot/dts/tegra-ventana.dts                |   42 ++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |   47 +++++++++-
 arch/arm/boot/dts/tegra30.dtsi                     |   59 +++++++++++-
 12 files changed, 484 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/emc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
