From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.9-rc1
Date: Fri,  9 Sep 2016 17:20:32 +0200
Message-ID: <20160909152032.9550-4-thierry.reding@gmail.com>
References: <20160909152032.9550-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160909152032.9550-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.9-arm64-dt

for you to fetch changes up to 988232412e6711a9bbdc06d4e008b552bbf7cd06:

  arm64: tegra: Select PM_GENERIC_DOMAINS (2016-08-24 17:11:44 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v4.9-rc1

Add a couple of devices (AGIC, ADMA) on Tegra210 and enable them on
Smaug. Also enable DPAUX on Smaug to allow the I2C bus that shares pads
with the DPAUX to be used to access various audio devices. Furthermore,
enable the XUSB controller on Smaug for USB 3.0 support.

Finally, select PM_GENERIC_DOMAINS for 64-bit Tegra devices to make sure
devices are probed only after their power partitions have been enabled.

----------------------------------------------------------------
Jon Hunter (9):
      arm64: tegra: Drop clock and reset names for XUSB powergates
      arm64: tegra: Add AGIC node for Tegra210
      arm64: tegra: Add ADMA node for Tegra210
      arm64: tegra: Add SOR power-domain for Tegra210
      arm64: tegra: Add ACONNECT, ADMA and AGIC nodes Tegra210 Smaug
      arm64: tegra: Enable DPAUX for Tegra210 Smaug
      arm64: tegra: Add the various audio devices for Tegra210 Smaug
      arm64: tegra: Enable XUSB controller on Tegra210 Smaug
      arm64: tegra: Select PM_GENERIC_DOMAINS

Stephen Warren (1):
      arm64: tegra: Simplify Tegra210 GPIO compatible value

 arch/arm64/Kconfig.platforms                  |   2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 120 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  79 +++++++++++++++--
 3 files changed, 194 insertions(+), 7 deletions(-)
