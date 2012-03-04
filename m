From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL 4/6] ARM: tegra: SoC driver updates
Date: Sun,  4 Mar 2012 12:14:00 -0800
Message-ID: <1330892042-32065-5-git-send-email-olof@lixom.net>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git tags/tegra-soc-drivers

for you to fetch changes up to e77a6b313fdfe4faa8f9a8edf919c7eb8d095fb5:

  ARM: tegra: uncompress.h: Don't depend on kernel headers (2012-02-27 13:45:54 -0800)

----------------------------------------------------------------
Tegra SoC driver support.

Some device tree conversions, some new drivers. and a fix for an issue
introduced in Grant Likely's irq_domain conversion in his tree. Because
of that, this branch depends on his branch to build (but not to merge):

git://git.secretlab.ca/git/linux-2.6.git irqdomain/next

----------------------------------------------------------------
Doug Anderson (2):
      ARM: tegra: Introduce define DEBUG_UART_SHIFT
      ARM: tegra: uncompress.h: Store UART address in a variable

Laxman Dewangan (2):
      ARM: tegra: Pause DMA when reading transfer count
      ARM: tegra: dma: not required to move requestor when stopping.

Leon Romanovsky (2):
      ARM: dt: tegra: Enable device tree audio codec on PAZ00 board.
      ARM: dt: tegra: Enable headset autodetection on PAZ00 board.

Olof Johansson (9):
      ARM: tegra: emc: device tree bindings
      ARM: tegra: seaboard: add EMC table to device tree
      ARM: tegra: Don't WARN_ON() for too early dma channel allocations
      ARM: tegra: use APB DMA for accessing APB devices
      ARM: tegra: fuse: use apbio dma for register access
      ARM: tegra: fuse: add functions to access chip revision
      ARM: tegra: fuse: add bct strapping reading
      ARM: tegra: emc: convert tegra2_emc to a platform driver
      ARM: tegra: emc: device tree support

Stephen Warren (19):
      dt: tegra gpio: Flesh out binding documentation
      ARM: dt: tegra30.dtsi: Reformat gpio's interrupts property
      ARM: dt: tegra30.dtsi: Add extra GPIO interrupt
      ARM: dt: tegra: Add Tegra APB DMA device tree binding
      ARM: dt: tegra: Modify I2S nodes to match binding
      ARM: dt: tegra: Add labels for I2S controllers
      ARM: dt: tegra: Enable audio on WM8903 boards, disable others
      ARM: dt: Add binding for Tegra PMC
      ARM: tegra: Support Tegra30 in decompressor UART setup
      ARM: tegra: uncompress.h: Choose a UART at runtime
      ARM: tegra: Pass uncompress.h UART selection to DEBUG_LL
      ARM: tegra: Remove use of TEGRA_GPIO_TO_IRQ
      gpio: tegra: Dynamically allocate IRQ base, and support DT
      gpio: tegra: Parameterize the number of banks
      ARM: tegra: Fix EMC pdata initialization from registers
      ARM: tegra: Add a simple PMC driver
      ARM: tegra: Remove duplicate PMU interrupt inversion code
      gpio: tegra: Fix build issue due to irq_domain rework.
      ARM: tegra: uncompress.h: Don't depend on kernel headers

 .../devicetree/bindings/arm/tegra/emc.txt          |  100 +++++++++
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |   19 ++
 .../devicetree/bindings/dma/tegra20-apbdma.txt     |   30 +++
 .../devicetree/bindings/gpio/gpio_nvidia.txt       |   36 +++-
 arch/arm/boot/dts/tegra-harmony.dts                |   45 +++-
 arch/arm/boot/dts/tegra-paz00.dts                  |   30 +++
 arch/arm/boot/dts/tegra-seaboard.dts               |   78 +++++++
 arch/arm/boot/dts/tegra-trimslice.dts              |   12 +
 arch/arm/boot/dts/tegra-ventana.dts                |   42 ++++
 arch/arm/boot/dts/tegra20.dtsi                     |   43 ++++-
 arch/arm/boot/dts/tegra30.dtsi                     |   53 +++++-
 arch/arm/mach-tegra/Makefile                       |    3 +-
 arch/arm/mach-tegra/apbio.c                        |  145 +++++++++++++
 arch/arm/mach-tegra/apbio.h                        |   39 ++++
 arch/arm/mach-tegra/board-harmony-power.c          |   15 --
 arch/arm/mach-tegra/board-harmony.c                |    2 +-
 arch/arm/mach-tegra/board-seaboard.c               |    5 +-
 arch/arm/mach-tegra/common.c                       |   20 ++
 arch/arm/mach-tegra/dma.c                          |  128 +++++++-----
 arch/arm/mach-tegra/fuse.c                         |  107 +++++++---
 arch/arm/mach-tegra/fuse.h                         |   34 +++-
 arch/arm/mach-tegra/include/mach/debug-macro.S     |   88 +++++++-
 arch/arm/mach-tegra/include/mach/gpio-tegra.h      |    2 -
 arch/arm/mach-tegra/include/mach/irammap.h         |   35 +++
 arch/arm/mach-tegra/include/mach/uncompress.h      |  120 ++++++++++-
 arch/arm/mach-tegra/pmc.c                          |   76 +++++++
 arch/arm/mach-tegra/pmc.h                          |   23 ++
 arch/arm/mach-tegra/tegra2_clocks.c                |    2 +-
 arch/arm/mach-tegra/tegra2_emc.c                   |  224 ++++++++++++++++++--
 arch/arm/mach-tegra/tegra2_emc.h                   |   11 +-
 drivers/gpio/gpio-tegra.c                          |   59 ++++--
 include/linux/platform_data/tegra_emc.h            |   34 +++
 32 files changed, 1467 insertions(+), 193 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/emc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
 create mode 100644 arch/arm/mach-tegra/apbio.c
 create mode 100644 arch/arm/mach-tegra/apbio.h
 create mode 100644 arch/arm/mach-tegra/include/mach/irammap.h
 create mode 100644 arch/arm/mach-tegra/pmc.c
 create mode 100644 arch/arm/mach-tegra/pmc.h
 create mode 100644 include/linux/platform_data/tegra_emc.h
