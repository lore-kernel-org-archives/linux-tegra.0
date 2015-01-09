From: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH 0/4] ARM: tegra: Support for big-endian (version 3)
Date: Fri,  9 Jan 2015 15:27:07 +0000
Message-ID: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
Cc: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

During testing of big-endian on a Jetson TK1 with baserock, the following
issues were found and fixed. Note that to get the system running with
big-endian you will need to disable ARCH_SUSPEND_POSSIBLE within
arch/arm/Kconfig.

Bob Mottram (4):
  ARM: tegra: Add a separate big-endian configuration
  ARM: gpio: tegra: Maintain endianness
  ARM: tegra: enable big-endian support
  ARM: tegra: fix big-endian issue with irq code

 arch/arm/configs/tegra_be_defconfig | 298 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Kconfig         |   1 +
 arch/arm/mach-tegra/headsmp.S       |   3 +-
 arch/arm/mach-tegra/irq.c           |   2 +-
 drivers/gpio/gpio-tegra.c           |   4 +-
 5 files changed, 304 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/configs/tegra_be_defconfig

--
2.1.0
