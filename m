From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 3/5] ARM: tegra: Core SoC changes for v4.5-rc1
Date: Thu, 17 Dec 2015 13:50:37 +0100
Message-ID: <1450356639-7758-3-git-send-email-thierry.reding@gmail.com>
References: <1450356639-7758-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450356639-7758-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.5-soc

for you to fetch changes up to a262e87ff354f12447bb6268bd63edf7ba1c20e0:

  ARM: tegra: select USB_ULPI from EHCI rather than platform (2015-11-24 16:47:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core SoC changes for v4.5-rc1

The big thing here is Tegra210 support, which is really only the Kconfig
symbol. Other than that there's a few miscellaneous fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: tegra: select USB_ULPI from EHCI rather than platform

Jon Hunter (1):
      ARM: tegra: Ensure entire dcache is flushed on entering LP0/1

Thierry Reding (3):
      soc/tegra: Provide per-SoC Kconfig symbols
      soc/tegra: Add Tegra210 support
      amba: Hide TEGRA_AHB symbol

 arch/arm/mach-tegra/Kconfig         | 54 +-----------------------
 arch/arm/mach-tegra/sleep-tegra20.S |  3 ++
 arch/arm/mach-tegra/sleep-tegra30.S |  3 ++
 arch/arm64/Kconfig.platforms        | 12 ------
 drivers/amba/Kconfig                |  2 +-
 drivers/soc/Kconfig                 |  1 +
 drivers/soc/tegra/Kconfig           | 83 +++++++++++++++++++++++++++++++++++++
 drivers/usb/host/Kconfig            |  2 +
 8 files changed, 94 insertions(+), 66 deletions(-)
 create mode 100644 drivers/soc/tegra/Kconfig
