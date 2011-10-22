From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/3] paz00 updates for 3.3
Date: Sat, 22 Oct 2011 22:16:31 +0200
Message-ID: <cover.1319313019.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

the following three patches are intended for the 3.3 merge window and are based
on linux-next.

The first one adds support for the embedded controller (which handles keyboard,
touchpad, leds, and suspend functions - and some other stuff). The way it is
initialized will probably change in the future, but we like to include it for
now as it makes debugging more easier.

The second patch adds wakeup support similar to seaboard, but with the
difference that the wakeup gpio is connected to the embedded controller instead
of a real gpio key.

The final patch adds a dts file for paz00. I also like add paz00 to board-dt.c,
but I couldn't find an up to date version of it (which includes all the patches
on the tegra-ml). I'll update this one as soon as it emerges. So take it as some
kind of "preview".

Thanks

Marc

Marc Dietrich (3):
  ARM: tegra: paz00: add support for the embedded controller
  ARM: tegra: paz00: add support for wakeup gpio key
  arm/dt: tegra: add dts file for paz00

 arch/arm/boot/dts/tegra-paz00.dts        |   51 ++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-paz00-pinmux.c |    1 +
 arch/arm/mach-tegra/board-paz00.c        |   40 +++++++++++++++++++++++-
 arch/arm/mach-tegra/board-paz00.h        |    6 +++
 4 files changed, 97 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-paz00.dts

-- 
1.7.5.4
