From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] ARM: Tegra: Enable audio (boards-for-next-i2c)
Date: Fri,  4 Mar 2011 22:42:27 -0700
Message-ID: <1299303752-7779-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is the complete patch series to enable audio on Tegra Harmony, based
on Olof's boards-for-next-i2c branch.

Stephen Warren (5):
  ARM: Tegra: Add devices.c entries for audio
  ARM: Tegra: Create defines for SD-related GPIO names
  ARM: tegra: Harmony: Beginnings of audio support
  ARM: tegra: Harmony: I2C-related portions of audio support
  ARM: tegra: Harmony: Set WM8903 gpio_base

 arch/arm/mach-tegra/board-harmony-pinmux.c  |   28 ++++++-----
 arch/arm/mach-tegra/board-harmony.c         |   61 +++++++++++++++++++++--
 arch/arm/mach-tegra/board-harmony.h         |   14 +++++
 arch/arm/mach-tegra/board-seaboard-pinmux.c |   12 ++--
 arch/arm/mach-tegra/board-seaboard.c        |    6 +-
 arch/arm/mach-tegra/board-seaboard.h        |    3 +
 arch/arm/mach-tegra/devices.c               |   70 +++++++++++++++++++++++++++
 arch/arm/mach-tegra/devices.h               |    4 ++
 arch/arm/mach-tegra/include/mach/iomap.h    |    3 +
 9 files changed, 174 insertions(+), 27 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
