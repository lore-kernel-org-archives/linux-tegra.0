From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] ARM: tegra: cleanup branch
Date: Tue, 08 May 2012 12:15:43 -0600
Message-ID: <4FA962CF.1030809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A couple of small cleanups for Tegra, independent from anything else:

The following changes since commit 0034102808e0dbbf3a2394b82b1bb40b5778de9e:
  Linus Torvalds (1):
        Linux 3.4-rc2

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
for-3.5/cleanup

Arnd Bergmann (1):
      ARM: tegra: do not hide dma declarations

Danny Kukawka (1):
      ARM: tegra: fix multiple asm/hardware/gic.h inclusion

 arch/arm/mach-tegra/board-dt-tegra20.c |    1 -
 arch/arm/mach-tegra/include/mach/dma.h |    4 ----
 2 files changed, 0 insertions(+), 5 deletions(-)
