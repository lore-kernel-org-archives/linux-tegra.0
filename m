From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 8/8] ARM: tegra: defconfig update
Date: Wed, 30 Jan 2013 14:42:39 -0700
Message-ID: <1359582159-28816-8-git-send-email-swarren@wwwdotorg.org>
References: <1359582159-28816-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359582159-28816-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Various new features are enabled on Tegra:
* RTC_DRV_TPS6586X to enable the RTC on many boards, such as Harmony
  and Ventana.
* POWER_RESET_GPIO to provide a power off driver for TrimSlice.
* Tegra KBC controller support, for Seaboard, Harmony, and Whistler.
* Tegra high-speed UART driver, for Cardhu Bluetooth.
* kexec support.

This pull request is based on v3.8-rc3.

----------------------------------------------------------------

The following changes since commit 9931faca02c604c22335f5a935a501bb2ace6e20:

  Linux 3.8-rc3

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.9-defconfig

for you to fetch changes up to a05b0d505e76161b485db360f5eac5436e2fc2c6:

  ARM: tegra: defconfig updates

----------------------------------------------------------------

Laxman Dewangan (1):
      ARM: tegra: defconfig updates

 arch/arm/configs/tegra_defconfig |    6 ++++++
 1 file changed, 6 insertions(+)
