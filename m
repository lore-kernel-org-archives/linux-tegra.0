From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] [3.2] Please pull tegra boards for 3.2
Date: Thu, 25 Aug 2011 22:40:00 -0700
Message-ID: <CAOesGMh+r=GV1vJ9bK8WUmePkJ-BKf7HnTo29+3fnMdwNvmCiA@mail.gmail.com>
References: <CAOesGMjHN-pvVfMN0o3AD238m8wEiRS-D4ArjV_2VAGTuwPfBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjHN-pvVfMN0o3AD238m8wEiRS-D4ArjV_2VAGTuwPfBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Arnd,

Please pull the first set of tegra/board patches for 3.2. Same
contents as last time, but rebased on top of 3.1-rc3:

The following changes since commit fcb8ce5cfe30ca9ca5c9a79cdfe26d1993e65e0c:

  Linux 3.1-rc3 (2011-08-22 11:42:53 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git boards-for-3.2

Marc Dietrich (5):
      ARM: tegra: paz00: add support serial port on JP1
      ARM: tegra: paz00: enable rfkill for internal wifi card
      ARM: tegra: paz00: enable wifi led
      ARM: tegra: paz00: reorder the SDHCI channel init
      ARM: tegra: paz00: add clocks required for usb operation

Stephen Warren (4):
      ARM: Tegra: Harmony: Add USB device
      ARM: Tegra: Seaboard board updates for audio
      ARM: Tegra: Seaboard: Add USB devices
      ARM: Tegra: Force PORT_TEGRA as the UART type

 arch/arm/mach-tegra/board-harmony.c         |    5 +-
 arch/arm/mach-tegra/board-paz00-pinmux.c    |    3 +
 arch/arm/mach-tegra/board-paz00.c           |   62 ++++++++++++++++++++-
 arch/arm/mach-tegra/board-paz00.h           |   16 ++++-
 arch/arm/mach-tegra/board-seaboard-pinmux.c |    6 +-
 arch/arm/mach-tegra/board-seaboard.c        |   81 ++++++++++++++++++++++++++-
 arch/arm/mach-tegra/board-seaboard.h        |   12 +++-
 arch/arm/mach-tegra/board-trimslice.c       |    3 +-
 8 files changed, 173 insertions(+), 15 deletions(-)
