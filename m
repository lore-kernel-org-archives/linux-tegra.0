From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] ARM: tegra: for-3.5/ahb branch
Date: Mon, 14 May 2012 13:46:34 -0600
Message-ID: <1337024794-25269-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch adds the Tegra AHB driver.

I meant to send this with the other two pull requests this morning, but
forgot:-(

This is the last pull request I intend to send for 3.5, except for any
bugs that crop up.

----------------------------------------------------------------

The following changes since commit e816b57a337ea3b755de72bec38c10c864f23015:

  Linux 3.4-rc3

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.5/ahb

for you to fetch changes up to 89c788bab1f0374ae05aef7560066442ceb55384:

  ARM: tegra: Add SMMU enabler in AHB

----------------------------------------------------------------

Hiroshi DOYU (2):
      ARM: tegra: Add Tegra AHB driver
      ARM: tegra: Add SMMU enabler in AHB

 .../bindings/arm/tegra/nvidia,tegra20-ahb.txt      |   11 +
 arch/arm/mach-tegra/Kconfig                        |    8 +
 arch/arm/mach-tegra/include/mach/tegra-ahb.h       |   19 +
 drivers/Makefile                                   |    2 +-
 drivers/amba/Makefile                              |    4 +-
 drivers/amba/tegra-ahb.c                           |  293 +++++++++++++++
 6 files changed, 334 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
 create mode 100644 arch/arm/mach-tegra/include/mach/tegra-ahb.h
 create mode 100644 drivers/amba/tegra-ahb.c
