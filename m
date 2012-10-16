From: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] ARM: tegra: bring back tegra_timer clock
Date: Tue, 16 Oct 2012 13:08:34 +0300
Message-ID: <1350382116-18024-1-git-send-email-sivaramn@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patchset fixes a bug introduced by commit
20f4665831cec65d6e5d33587bba28ffa536b91d by bringing back the
tegra_timer clock.  The above commit caused tegra_init_timer() failing
to get the clk reference.

The first patch renames the existing tegra_timer object to
tegra_sys_timer and the second patch adds previously-removed tegra_timer
clock object.

Sivaram Nair (2):
  ARM: tegra: rename tegra system timer
  ARM: tegra: add tegra_timer clock

 arch/arm/mach-tegra/board-dt-tegra20.c    |    2 +-
 arch/arm/mach-tegra/board-dt-tegra30.c    |    2 +-
 arch/arm/mach-tegra/board.h               |    2 +-
 arch/arm/mach-tegra/tegra20_clocks_data.c |    1 +
 arch/arm/mach-tegra/tegra30_clocks_data.c |    1 +
 arch/arm/mach-tegra/timer.c               |    2 +-
 6 files changed, 6 insertions(+), 4 deletions(-)
