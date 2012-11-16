From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 6/6] ARM: tegra: defconfig update
Date: Fri, 16 Nov 2012 12:43:58 -0700
Message-ID: <1353095038-20031-6-git-send-email-swarren@wwwdotorg.org>
References: <1353095038-20031-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353095038-20031-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Many new features are enabled in tegra_defconfig:

* BRCMFMAC: wlan driver, enable as module.
* MTD, MTD_CHAR, MTD_M25P80, SPI_TEGRA20_SLINK, CONFIG_SPI_TEGRA20_SFLASH
  to enable serial flash on Cardhu and TrimSlice.
* PWM/backlight features for use with tegradrm.
* tegradrm; Tegra's new display driver.
* CMA, so that tegradrm can allocate large buffers.
* SquashFS, which is used as the root filesystem on boards based on
  the Tamonten processor module.

----------------------------------------------------------------

The following changes since commit 3d70f8c617a436c7146ecb81df2265b4626dfe89:

  Linux 3.7-rc4

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.8-defconfig

for you to fetch changes up to 6254f95b7c22264622b6bd6515b609d9cf88393f:

  ARM: tegra: defconfig updates

----------------------------------------------------------------

Stephen Warren (1):
      ARM: tegra: defconfig updates

 arch/arm/configs/tegra_defconfig |   21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)
