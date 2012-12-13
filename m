From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] ARM: tegra: fixes for 3.8
Date: Thu, 13 Dec 2012 16:19:07 -0700
Message-ID: <1355440747-22295-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This branch contains a few miscellaneous fixes that have shown up in the
last few weeks.

----------------------------------------------------------------

The following changes since commit 9489e9dcae718d5fde988e4a684a0f55b5f94d17:

  Linux 3.7-rc7

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.8-fixes-for-rc1

for you to fetch changes up to f110174910896b7a7d91c0c60d19136815f68c54:

  amba: tegra-ahb: Fix warning w/o PM_SLEEP

----------------------------------------------------------------

Hiroshi Doyu (1):
      amba: tegra-ahb: Fix warning w/o PM_SLEEP

Sivaram Nair (2):
      ARM: tegra: select correct parent clk for pll_p
      ARM: tegra: fix comment in dsib clk set_parent

 arch/arm/mach-tegra/common.c         |    2 +-
 arch/arm/mach-tegra/tegra30_clocks.c |    4 +---
 drivers/amba/tegra-ahb.c             |    2 ++
 3 files changed, 4 insertions(+), 4 deletions(-)
