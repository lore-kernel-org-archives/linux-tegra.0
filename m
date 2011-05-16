From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 0/4] ARM: tegra: paz00 patches for 2.6.40
Date: Mon, 16 May 2011 20:10:54 +0200
Message-ID: <1305569458-4821-1-git-send-email-marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Collin,

the following patches are intended for 2.6.40 merge. They are mostly similar
to the TrimSlice patches sent by Mike a few days ago.

We are still stuggling with the sound codec (alc5632) and the nvec, so there
is nothing to connect to the i2c yet. On the other hand, I'm wondering what's
up with the atd7461 included in most (all?) boards. It's compatible with lm90,
but the driver will never register because of the wrong name.

May I ask if there is some timeline for framebuffer integration? A netbook
without display is of not much use (ok, same holds for keyboard/mouse).

Thanks!

Marc

Marc Dietrich (4):
  ARM: tegra: paz00: whitespace cleanup
  ARM: tegra: paz00: register i2c busses
  ARM: tegra: paz00: enable usb ports
  ARM: tegra: paz00: cleanup sdhci ports

 arch/arm/mach-tegra/board-paz00-pinmux.c |   10 ++---
 arch/arm/mach-tegra/board-paz00.c        |   72 +++++++++++++++++++++++++----
 arch/arm/mach-tegra/board-paz00.h        |   10 ++---
 3 files changed, 70 insertions(+), 22 deletions(-)

-- 
1.7.4.2
