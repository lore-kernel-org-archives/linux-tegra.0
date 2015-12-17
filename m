From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 5/5] ARM: tegra: Default configuration updates for v4.5-rc1
Date: Thu, 17 Dec 2015 13:50:39 +0100
Message-ID: <1450356639-7758-5-git-send-email-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.5-defconfig

for you to fetch changes up to 36d6e0872152aab506f952792db7221b9c25ed33:

  arm64: defconfig: Enable printk timestamps (2015-11-16 15:48:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration updates for v4.5-rc1

This set of patches enable various drivers and features required by
64-bit Tegra SoCs (Tegra132 and Tegra210).

----------------------------------------------------------------
Thierry Reding (7):
      arm64: defconfig: Enable Tegra210 support
      arm64: defconfig: Do not disable Tegra AHB driver
      arm64: defconfig: Enable tegra-apbdma driver
      arm64: defconfig: Enable serial-tegra driver
      arm64: defconfig: Enable sdhci-tegra driver
      arm64: defconfig: Enable squashfs support
      arm64: defconfig: Enable printk timestamps

 arch/arm64/configs/defconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
