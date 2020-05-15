From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 11/11] arm64: tegra: Device tree changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:11 +0200
Message-ID: <20200515145311.1580134-12-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-arm64-dt

for you to fetch changes up to 74265112c60be0209817c682ba68661c05da1d38:

  arm64: tegra: Enable VI I2C on Jetson Nano (2020-05-15 16:28:58 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.8-rc1

This contains a couple of fixes for minor issues, enables XUDC support
on Tegra194, and enables EMC frequency scaling and video capture on
Tegra210.

----------------------------------------------------------------
Jon Hunter (2):
      arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
      arm64: tegra: Allow the PMIC RTC to wakeup Jetson Xavier

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

Thierry Reding (3):
      Merge branch 'for-5.8/dt-bindings' into for-5.8/arm64/dt
      arm64: tegra: Hook up EMC cooling device
      arm64: tegra: Enable VI I2C on Jetson Nano

Vidya Sagar (1):
      arm64: tegra: Fix flag for 64-bit resources in 'ranges' property

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  5 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 30 ++++++--
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 10 +++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  4 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 89 ++++++++++++++++++++--
 include/dt-bindings/clock/tegra210-car.h           |  2 +-
 7 files changed, 125 insertions(+), 17 deletions(-)
