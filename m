From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 08/10] ARM: tegra: second round of cleanups
Date: Fri, 14 Sep 2012 14:06:19 -0600
Message-ID: <1347653181-19936-8-git-send-email-swarren@wwwdotorg.org>
References: <1347653181-19936-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347653181-19936-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch mainly removes dead code following the removal of all board
files. The removals depend on various changes in other branches, so they
are all merged together and form the basis of this branch, as enumerated
below.

Finally, there are no remaining users of pinconf-tegra.h outside the
pinctrl subsystem, so that header is incorporated into an existing file
there. This reduces the number of headers in mach-tegra/include, and so
helps move towards single zImage.

This branch is based on tegra-for-3.7-cleanup, followed by a merge of
tegra-for-3.7-board-removal, followed by a merge of
tegra-for-3.7-common-clk, followed by a merge of:

git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git xceiv-for-v3.7

----------------------------------------------------------------

The following changes since commit fef40b2369a4ececa16b4d02b625e45252fe5d0a:

  Merge commit 'xceiv-for-v3.7' into for-3.7/cleanup2

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.7-cleanup2

for you to fetch changes up to 3b2f9412962d2baaa8bf8297103c2ae46b6f929d:

  pinctrl: tegra: move pinconf-tegra.h content into drivers/pinctrl

----------------------------------------------------------------

Stephen Warren (4):
      ARM: tegra: remove dead code
      ARM: tegra: remove useless includes of <mach/*.h>
      ARM: tegra: delete unused headers
      pinctrl: tegra: move pinconf-tegra.h content into drivers/pinctrl

 arch/arm/mach-tegra/Makefile                     |    2 -
 arch/arm/mach-tegra/board-dt-tegra20.c           |   27 +-
 arch/arm/mach-tegra/board-pinmux.c               |   87 --
 arch/arm/mach-tegra/board-pinmux.h               |   54 --
 arch/arm/mach-tegra/devices.c                    |  702 -----------------
 arch/arm/mach-tegra/devices.h                    |   60 --
 arch/arm/mach-tegra/dma.c                        |    1 -
 arch/arm/mach-tegra/include/mach/gpio-tegra.h    |   28 -
 arch/arm/mach-tegra/include/mach/pinconf-tegra.h |   63 --
 arch/arm/mach-tegra/include/mach/suspend.h       |   38 -
 arch/arm/mach-tegra/tegra20_clocks.c             |    1 -
 arch/arm/mach-tegra/tegra20_clocks_data.c        |    1 -
 arch/arm/mach-tegra/timer.c                      |    1 -
 drivers/pinctrl/pinctrl-tegra.c                  |    2 -
 drivers/pinctrl/pinctrl-tegra.h                  |   44 +
 drivers/usb/phy/tegra_usb_phy.c                  |    1 -
 16 files changed, 70 insertions(+), 1042 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/board-pinmux.c
 delete mode 100644 arch/arm/mach-tegra/board-pinmux.h
 delete mode 100644 arch/arm/mach-tegra/devices.c
 delete mode 100644 arch/arm/mach-tegra/devices.h
 delete mode 100644 arch/arm/mach-tegra/include/mach/gpio-tegra.h
 delete mode 100644 arch/arm/mach-tegra/include/mach/pinconf-tegra.h
 delete mode 100644 arch/arm/mach-tegra/include/mach/suspend.h
