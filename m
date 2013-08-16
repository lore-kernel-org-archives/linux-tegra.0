From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 4/4] ARM: tegra: defconfig update for 3.12
Date: Fri, 16 Aug 2013 11:20:28 -0600
Message-ID: <1376673628-5867-4-git-send-email-swarren@wwwdotorg.org>
References: <1376673628-5867-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376673628-5867-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This defconfig change enables:
* SYSVIPC (needed for some apps, e.g. fakeroot).
* Elantech touchpad (touchpad on AC100).
* SCSI_MULTI_LUN (needed for some USB SD card readers).
* PCI, MSI, and Tegra's PCIe driver.
* USB XHCI; useful for testing PCIe.

----------------------------------------------------------------

The following changes since commit ad81f0545ef01ea651886dddac4bef6cec930092:

  Linux 3.11-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.12-defconfig

for you to fetch changes up to 25819408cdd8c019277d9b4906ac7345fc1817bd:

  ARM: tegra: defconfig updates

----------------------------------------------------------------

Stephen Warren (1):
      ARM: tegra: defconfig updates

 arch/arm/configs/tegra_defconfig | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
