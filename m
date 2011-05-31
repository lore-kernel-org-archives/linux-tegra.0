From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] Tegra bugfixes for 3.0
Date: Tue, 31 May 2011 15:14:06 -0600
Message-ID: <1306876448-28147-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Two fixes for Tegra boards:

The first fixes a regression on board Harmony. Without this, some devices
won't initialize correctly due to conflicting gpiolib base "addresses".

The second could be considered a bugfix or a convenience. It's very
useful, but less important than the Harmony fix if you need to merge
just one:-)

Note: These were created against Linus's tree, a little after 3.0rc1, since
the Tegra for-next is pretty stale. To be precise:

af0d6a0a3a30946f7df69c764791f1b0643f7cd6
Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip

Stephen Warren (2):
  ARM: Tegra: Harmony: Fix conflicting GPIO numbering
  ARM: Tegra: Seaboard: Re-order sdhci device registration

 arch/arm/mach-tegra/board-harmony-power.c |    4 +++-
 arch/arm/mach-tegra/board-harmony.h       |    3 ++-
 arch/arm/mach-tegra/board-seaboard.c      |    4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)
