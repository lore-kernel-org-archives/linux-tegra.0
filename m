From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL v2 11/11] arm64: tegra: Device tree changes for v5.8-rc1
Date: Fri, 22 May 2020 16:28:46 +0200
Message-ID: <20200522142846.2376224-3-thierry.reding@gmail.com>
References: <20200515145311.1580134-12-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-12-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-arm64-dt-v2

for you to fetch changes up to 358a6777f5dd293bc3c075af6fc8c0dd18774c96:

  arm64: tegra: Make the RTC a wakeup source on Jetson Nano and TX1 (2020-05-22 14:56:54 +0200)

This is a slightly rebased version of the prior pull request which has
the commit log cleaned up as I mentioned earlier. I've also included a
patch to enable resume from suspend via the PMIC on Jetson TX1 and
Jetson Nano, which will help us to test suspend/resume in our test
system in a unified way.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.8-rc1

This contains a couple of fixes for minor issues, enables XUDC support
on Tegra194, and enables EMC frequency scaling and video capture on
Tegra210.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
      arm64: tegra: Allow the PMIC RTC to wakeup Jetson Xavier
      arm64: tegra: Make the RTC a wakeup source on Jetson Nano and TX1

Joseph Lo (1):
      arm64: tegra: Add external memory controller node for Tegra210

Nagarjuna Kristam (1):
      arm64: tegra: Add XUDC node on Tegra194

Rob Herring (1):
      arm64: tegra: Kill off "simple-panel" compatibles

Sowjanya Komatineni (4):
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      arm64: tegra: Fix SOR powergate clocks and reset
      arm64: tegra: Add reset-cells to memory controller
      arm64: tegra: Add Tegra VI CSI support in device tree

Thierry Reding (4):
      Merge branch 'for-5.8/dt-bindings' into for-5.8/arm64/dt
      arm64: tegra: Hook up EMC cooling device
      arm64: tegra: Enable VI I2C on Jetson Nano
      arm64: tegra: Make the RTC a wakeup source on Jetson TX2

Vidya Sagar (1):
      arm64: tegra: Fix flag for 64-bit resources in 'ranges' property

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  3 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  5 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 30 ++++++--
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  3 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 10 +++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  7 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 89 ++++++++++++++++++++--
 include/dt-bindings/clock/tegra210-car.h           |  2 +-
 9 files changed, 131 insertions(+), 20 deletions(-)
