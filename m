From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 8/9] arm64: tegra: Device tree changes for v5.1-rc1
Date: Fri,  8 Feb 2019 16:09:34 +0100
Message-ID: <20190208150935.32108-9-thierry.reding@gmail.com>
References: <20190208150935.32108-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208150935.32108-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.1-arm64-dt

for you to fetch changes up to 250a36c06f95caaeef0da218f87fd452766eefd6:

  arm64: tegra: Update compatible for Tegra186 I2C (2019-02-07 19:03:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.1-rc1

This contains a couple of fixes to existing device trees, enables CPU
frequency scaling on various Tegra210 boards, enables the TCU as debug
serial port on Jetson Xavier, adds various improvements for SDMMC on
Tegra210, Tegra186 and Tegra194 boards and finally adds initial support
for the NVIDIA Shield TV.

----------------------------------------------------------------
Joseph Lo (8):
      arm64: tegra: Fix register range of apbmisc on Tegra210
      arm64: tegra: Fix IRQ type of PMIC on Smaug
      arm64: tegra: Add DFLL clock on Tegra210
      arm64: tegra: Add CPU clocks on Tegra210
      arm64: tegra: Add pinmux for PWM-based DFLL support on P2597
      arm64: tegra: Enable DFLL clock on Jetson TX1
      arm64: tegra: Add CPU power rail regulator on Smaug
      arm64: tegra: Enable DFLL clock on Smaug

Mark Zhang (5):
      arm64: tegra: Remove property gpio-keys,name
      arm64: tegra: Add support for NVIDIA Shield TV
      arm64: tegra: Add gpio-keys nodes for Darcy
      arm64: tegra: Add pinmux for Darcy board
      arm64: tegra: Add regulators for Tegra210 Darcy

Mikko Perttunen (2):
      arm64: tegra: Add nodes for TCU on Tegra194
      arm64: tegra: Mark TCU as primary serial port on Tegra194 P2888

Sowjanya Komatineni (5):
      arm64: tegra: Add SDMMC auto-calibration settings
      arm64: tegra: Add CQE Support for SDMMC4
      arm64: tegra: Support 200 MHz for SDMMC on Tegra194
      arm64: tegra: Update compatible for Tegra210 I2C
      arm64: tegra: Update compatible for Tegra186 I2C

Thierry Reding (5):
      arm64: tegra: Use GIC_SPI for PMIC interrupt on Smaug
      arm64: tegra: p2972: Sort nodes properly
      arm64: tegra: p2597: Sort nodes by unit-address
      arm64: tegra: p3310: Use TEGRA186_ prefix for GPIO names
      arm64: tegra: p2771-0000: Use TEGRA186_ prefix for GPIO names

 arch/arm64/boot/dts/nvidia/Makefile                |    1 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   18 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   10 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   21 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |    2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   10 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   77 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   21 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   32 +-
 .../boot/dts/nvidia/tegra210-p2894-0050-a08.dts    |    9 +
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     | 1858 ++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   34 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   96 +-
 13 files changed, 2140 insertions(+), 49 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
