From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] please pull tegra-2.6 boards-for-next
Date: Mon, 7 Mar 2011 16:57:47 -0800
Message-ID: <AANLkTi=8MKieocha2G1U75412hg9Uucx5t0ZV+QyGNKv@mail.gmail.com>
References: <AANLkTinY8MTkq3Ry5k9k1GaWAwT=AZuFYPMWsGCZ_pNo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinY8MTkq3Ry5k9k1GaWAwT=AZuFYPMWsGCZ_pNo-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Updated to what was discussed in a separate thread: Picked up patches
that will no longer build in the branch alone, but will build once
pulled into linux-next with other driver changes.

I also picked up the paz00 support patch. It's independent of other
platforms and risk of regressions is low, even though it's late in the
release cycle.

Finally: did one last touchup to the harmony i2c code to add an __init
annotation to quiet a compile warning. I didn't repost that patch
since the diff was trivial.


Thanks!

-Olof


The following changes since commit d5fdafd38ca0c28c4648909ce0afd0a5420309ca:
  Mike Rapoport (1):
        ARM: tegra: trimslice: initialize PCI-e only when running on TrimSlice

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra-2.6.git
boards-for-next

Marc Dietrich (1):
      ARM: tegra: Add Toshiba AC100 support

Olof Johansson (3):
      ARM: tegra: seaboard: register i2c devices
      ARM: tegra: harmony: register i2c devices
      ARM: tegra: enable new drivers in defconfig

Stephen Warren (5):
      ARM: tegra: add devices.c entries for audio
      ARM: tegra: create defines for SD-related GPIO names
      ARM: tegra: harmony: Beginnings of audio support
      ARM: tegra: harmony: I2C-related portions of audio support
      ARM: tegra: harmony: Set WM8903 gpio_base

 arch/arm/configs/tegra_defconfig            |   17 +++-
 arch/arm/mach-tegra/Kconfig                 |    5 +
 arch/arm/mach-tegra/Makefile                |    3 +
 arch/arm/mach-tegra/board-harmony-pinmux.c  |   28 +++--
 arch/arm/mach-tegra/board-harmony.c         |   94 +++++++++++++++-
 arch/arm/mach-tegra/board-harmony.h         |   14 +++
 arch/arm/mach-tegra/board-paz00-pinmux.c    |  157 +++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-paz00.c           |  128 ++++++++++++++++++++++
 arch/arm/mach-tegra/board-paz00.h           |   29 +++++
 arch/arm/mach-tegra/board-seaboard-pinmux.c |   11 +-
 arch/arm/mach-tegra/board-seaboard.c        |   68 +++++++++++--
 arch/arm/mach-tegra/board-seaboard.h        |    3 +
 arch/arm/mach-tegra/devices.c               |   70 ++++++++++++
 arch/arm/mach-tegra/devices.h               |    4 +
 arch/arm/mach-tegra/include/mach/iomap.h    |    3 +
 15 files changed, 603 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm/mach-tegra/board-paz00-pinmux.c
 create mode 100644 arch/arm/mach-tegra/board-paz00.c
 create mode 100644 arch/arm/mach-tegra/board-paz00.h
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
