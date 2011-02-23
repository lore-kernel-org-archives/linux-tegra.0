From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] ARM: Tegra: Harmony: Enable audio driver
Date: Wed, 23 Feb 2011 11:58:47 -0700
Message-ID: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patchset enables the audio driver for Tegra Harmony.

Important notes:
* This series is based on Olof's recently posted boards-for-next branch.
  Some patches won't apply without that being in first.
* The final patch in the series depends on header adds/edits that are not
  in Tegra's for-next branch

See notes in the individual patches for further details.

Stephen Warren (5):
  ARM: Tegra: Add devices.c entries for audio
  ARM: Tegra: Rename I2S clocks to match driver name
  ARM: Tegra: Rename clk_dev1/2 to cdev1/2
  ARM: Tegra: Create defines for GPIO names
  ARM: Tegra: Enable Harmony audio support

 arch/arm/mach-tegra/board-harmony-pinmux.c  |   28 ++++++-----
 arch/arm/mach-tegra/board-harmony.c         |   70 ++++++++++++++++++++++++--
 arch/arm/mach-tegra/board-harmony.h         |   14 +++++
 arch/arm/mach-tegra/board-seaboard-pinmux.c |   10 ++--
 arch/arm/mach-tegra/board-seaboard.c        |    6 +-
 arch/arm/mach-tegra/board-seaboard.h        |    3 +
 arch/arm/mach-tegra/devices.c               |   70 +++++++++++++++++++++++++++
 arch/arm/mach-tegra/devices.h               |    4 ++
 arch/arm/mach-tegra/include/mach/iomap.h    |    3 +
 arch/arm/mach-tegra/tegra2_clocks.c         |   16 +++---
 10 files changed, 190 insertions(+), 34 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
