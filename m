From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL] arm/tegra fixes for 3.2-rc
Date: Wed, 9 Nov 2011 13:34:40 -0800
Message-ID: <CAOesGMip77Y7PMiCRginfZDoGe9k3jj33adP1SkJfNO1BBbrig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

A couple of fixes for 3.2-rc below. Nothing controversial.


Thanks!

-Olof

The following changes since commit 1ea6b8f48918282bdca0b32a34095504ee65bab5:

  Linux 3.2-rc1 (2011-11-07 16:16:02 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for-3.2/fixes

Stephen Warren (2):
      arm/tegra: Don't create duplicate gpio and pinmux devices
      arm/dt: Fix ventana SDHCI power-gpios

Yufeng Shen (1):
      arm/tegra: enable headphone detection gpio on seaboard

 arch/arm/boot/dts/tegra-ventana.dts          |    3 +--
 arch/arm/mach-tegra/board-dt.c               |   13 +++++++------
 arch/arm/mach-tegra/board-harmony-pinmux.c   |    6 +++++-
 arch/arm/mach-tegra/board-paz00-pinmux.c     |    6 +++++-
 arch/arm/mach-tegra/board-seaboard-pinmux.c  |    6 +++++-
 arch/arm/mach-tegra/board-trimslice-pinmux.c |    5 ++++-
 6 files changed, 27 insertions(+), 12 deletions(-)
