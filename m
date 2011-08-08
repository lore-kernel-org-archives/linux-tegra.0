From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/3] ARM: Tegra: Harmony & Seaboard USB and audio
Date: Mon,  8 Aug 2011 14:35:12 -0600
Message-ID: <1312835715-893-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is a slight rev of some patches I posted a little while ago, now
in a single series. The second patch has a minor revision that simplifies
board-seaboard-pinmux.c.

The (previous version of the) patches were previously Ack'd by Tegra
maintainers, and Colin asked Arnd to pick them up in arm-soc.git,
although I'm not sure if that request still holds given the merge
window is over?

Stephen Warren (3):
  ARM: Tegra: Harmony: Add USB device
  ARM: Tegra: Seaboard board updates for audio
  ARM: Tegra: Seaboard: Add USB devices

 arch/arm/mach-tegra/board-harmony.c         |    2 +
 arch/arm/mach-tegra/board-seaboard-pinmux.c |    6 ++-
 arch/arm/mach-tegra/board-seaboard.c        |   78 +++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-seaboard.h        |   12 +++--
 4 files changed, 92 insertions(+), 6 deletions(-)
