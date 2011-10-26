From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v2 0/3] paz00 updates for 3.3
Date: Wed, 26 Oct 2011 21:59:19 +0200
Message-ID: <cover.1319658296.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

the following three patches are intended for the 3.3 merge window and are based
on linux-next.

The first one adds wakeup support similar to seaboard, but with the difference
that the wakeup gpio is connected to the embedded controller instead of a real
gpio key.

The second one adds a device tree for paz00. There is a nvec node which defines
resources similar to the i2c controller and also adds additional required 
properties for the embedded controller (which handles keyboard,touchpad, leds,
and suspend functions - and some other stuff).
The way it is initialized will probably change in the future, but we like to
include it for now as it makes debugging more easier.

The final patch adds device tree support for the nvec driver so that the previous
commit is useful.

Thanks

Marc

Changes since v1
    - replace addition of the embedded controller to the board file by a device-tree
      based implementation.

Marc Dietrich (3):
  ARM: tegra: paz00: add support for wakeup gpio key
  arm/dt: tegra: add dts file for paz00
  staging: nvec: add device tree support

 arch/arm/boot/dts/tegra-paz00.dts |   70 +++++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile      |    1 +
 arch/arm/mach-tegra/Makefile.boot |    1 +
 arch/arm/mach-tegra/board-dt.c    |    3 ++
 arch/arm/mach-tegra/board-paz00.c |   29 +++++++++++++++-
 arch/arm/mach-tegra/board-paz00.h |    3 ++
 drivers/staging/nvec/nvec.c       |   39 +++++++++++++++++++-
 7 files changed, 143 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-paz00.dts

-- 
1.7.5.4
