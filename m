From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/5] ARM: tegra: paz00: updates for "for-next"
Date: Sun,  7 Aug 2011 21:00:50 +0200
Message-ID: <cover.1312735430.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Colin,

this is an update to the patches I send on July 15th. There are now five patches
which add the second serial port (some solder points on the mainboard) and Wifi
support (rfkill and LED) to PAZ00. Additionally, usb support is improved and
the SDHCI init order is changed.

Please queue them up for "for-next" after positive review of course.

Thanks

Marc

Marc Dietrich (5):
  ARM: tegra: paz00: add support serial port on JP1
  ARM: tegra: paz00: enable rfkill for internal wifi card
  ARM: tegra: paz00: enable wifi led
  ARM: tegra: paz00: add clocks required for usb operation
  ARM: tegra: paz00: reorder the SDHCI channel init

 arch/arm/mach-tegra/board-paz00-pinmux.c |    3 ++
 arch/arm/mach-tegra/board-paz00.c        |   57 +++++++++++++++++++++++++++++-
 arch/arm/mach-tegra/board-paz00.h        |   16 ++++++--
 3 files changed, 71 insertions(+), 5 deletions(-)

-- 
1.7.4.1
