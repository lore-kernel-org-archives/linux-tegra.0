From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [GIT PULL] Tegra updates for v3.1
Date: Thu, 14 Jul 2011 19:40:50 -0700
Message-ID: <CAMbhsRQoZ7vJGchkXLUOrOH4rpKJzJe-iGvLjTfBmz4R=8HtVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Arnd,

Please pull Tegra updates from:

git://android.git.kernel.org/kernel/tegra.git for-next

Mostly peripheral support in existing boards, but also a few fixes and
code reduction.

Thanks,
Colin

The following changes since commit 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc:

  Linux 3.0-rc7 (2011-07-11 16:51:52 -0700)

are available in the git repository at:
  git://android.git.kernel.org/kernel/tegra.git for-next

Colin Cross (3):
      ARM: tegra: remove mach/barriers.h
      ARM: tegra: remove copy-and-pasted i2c platform data in boards
      ARM: tegra: remove copy-and-pasted usb platform data from boards

KOSAKI Motohiro (1):
      arm,tegra: replace cpu_set() with modern api

Marc Dietrich (5):
      ARM: tegra: paz00: whitespace cleanup
      ARM: tegra: paz00: register i2c busses
      ARM: tegra: paz00: enable usb ports
      ARM: tegra: paz00: cleanup sdhci ports
      ARM: tegra: paz00: change the machine name

Mike Rapoport (3):
      ARM: tegra: trimslice: register i2c busses and devices
      ARM: tegra: trimslice: add audio devices and clocks
      ARM: tegra: trimslice: enable USB ports

Robert Morell (1):
      arm: tegra: remove generic disp clock divisor flag

Stephen Warren (1):
      ARM: Tegra: Seaboard: Re-order sdhci device registration

 arch/arm/Kconfig                             |    1 -
 arch/arm/mach-tegra/board-harmony.c          |   22 ----------
 arch/arm/mach-tegra/board-paz00-pinmux.c     |   10 ++---
 arch/arm/mach-tegra/board-paz00.c            |   31 +++++++++-----
 arch/arm/mach-tegra/board-paz00.h            |   10 ++---
 arch/arm/mach-tegra/board-seaboard.c         |   26 +-----------
 arch/arm/mach-tegra/board-trimslice-pinmux.c |    7 ++-
 arch/arm/mach-tegra/board-trimslice.c        |   56 ++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-trimslice.h        |    3 +
 arch/arm/mach-tegra/devices.c                |   53 ++++++++++++++++++++++--
 arch/arm/mach-tegra/include/mach/barriers.h  |   30 --------------
 arch/arm/mach-tegra/platsmp.c                |    2 +-
 arch/arm/mach-tegra/tegra2_clocks.c          |    4 +-
 13 files changed, 146 insertions(+), 109 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/include/mach/barriers.h
