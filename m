From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [GIT PULL] please pull tegra-2.6 boards-for-next
Date: Mon, 7 Mar 2011 01:09:00 -0800
Message-ID: <AANLkTinY8MTkq3Ry5k9k1GaWAwT=AZuFYPMWsGCZ_pNo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Colin,

These three patches do not depend on any of the driver code being
merged through other trees, so it could go in with the main tegra
merge for .39. Please pull.


The following changes since commit d5fdafd38ca0c28c4648909ce0afd0a5420309ca:
  Mike Rapoport (1):
        ARM: tegra: trimslice: initialize PCI-e only when running on TrimSlice

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra-2.6.git
boards-for-next

Stephen Warren (3):
      ARM: tegra: add devices.c entries for audio
      ARM: tegra: create defines for SD-related GPIO names
      ARM: tegra: harmony: Beginnings of audio support

 arch/arm/mach-tegra/board-harmony-pinmux.c  |   28 ++++++-----
 arch/arm/mach-tegra/board-harmony.c         |   38 ++++++++++++--
 arch/arm/mach-tegra/board-harmony.h         |   14 +++++
 arch/arm/mach-tegra/board-seaboard-pinmux.c |   10 ++--
 arch/arm/mach-tegra/board-seaboard.c        |    6 +-
 arch/arm/mach-tegra/board-seaboard.h        |    3 +
 arch/arm/mach-tegra/devices.c               |   70 +++++++++++++++++++++++++++
 arch/arm/mach-tegra/devices.h               |    4 ++
 arch/arm/mach-tegra/include/mach/iomap.h    |    3 +
 9 files changed, 150 insertions(+), 26 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
