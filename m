From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL] ARM: tegra: debug branch
Date: Tue, 08 May 2012 12:33:28 -0600
Message-ID: <4FA966F8.8090106@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch allows enhanced automatic selection of the UART to use for
debug spew.

The following changes since commit 0034102808e0dbbf3a2394b82b1bb40b5778de9e:
  Linus Torvalds (1):
        Linux 3.4-rc2

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
for-3.5/debug

Stephen Warren (1):
      ARM: tegra: uncompress.h: Implement TEGRA_DEBUG_UART_AUTO_ODMDATA

 arch/arm/mach-tegra/Kconfig                   |   29 ++++-
 arch/arm/mach-tegra/include/mach/uncompress.h |  176
++++++++++++++++++-------
 2 files changed, 153 insertions(+), 52 deletions(-)
