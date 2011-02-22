From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL] Please pull tegra board updates for .39
Date: Tue, 22 Feb 2011 12:40:00 -0800
Message-ID: <AANLkTimA1=CCXM8wmkoatL59mzitC=5-GK3HUs-_daE9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin,

The following changes since commit 92591f0c0e55f647ea0718711178bbeb2a261374:
  Colin Cross (1):
        ARM: tegra: common: Enable core clocks

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra-2.6.git
boards-for-next

Olof Johansson (7):
      ARM: tegra: add tegra_gpio_table and tegra_gpio_config
      ARM: tegra: harmony: move over to tegra_gpio_config
      ARM: tegra: common device resources
      ARM: tegra: remove stale nvidia atag handler
      ARM: tegra: harmony: register sdhci devices
      ARM: tegra: harmony: fix pinmux for MMC slot
      ARM: tegra: add seaboard, wario and kaen boards

 arch/arm/mach-tegra/Kconfig                 |   19 +
 arch/arm/mach-tegra/Makefile                |    4 +
 arch/arm/mach-tegra/board-harmony-pinmux.c  |   19 +-
 arch/arm/mach-tegra/board-harmony.c         |   55 ++--
 arch/arm/mach-tegra/board-seaboard-pinmux.c |  179 ++++++++++
 arch/arm/mach-tegra/board-seaboard.c        |  196 +++++++++++
 arch/arm/mach-tegra/board-seaboard.h        |   38 ++
 arch/arm/mach-tegra/devices.c               |  505 +++++++++++++++++++++++++++
 arch/arm/mach-tegra/devices.h               |   46 +++
 arch/arm/mach-tegra/gpio.c                  |   14 +
 arch/arm/mach-tegra/include/mach/gpio.h     |    7 +
 11 files changed, 1054 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm/mach-tegra/board-seaboard-pinmux.c
 create mode 100644 arch/arm/mach-tegra/board-seaboard.c
 create mode 100644 arch/arm/mach-tegra/board-seaboard.h
 create mode 100644 arch/arm/mach-tegra/devices.c
 create mode 100644 arch/arm/mach-tegra/devices.h
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
