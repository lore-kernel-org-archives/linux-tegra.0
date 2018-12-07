From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 6/6] arm64: tegra: Device tree change for v4.21-rc1
Date: Fri,  7 Dec 2018 15:17:39 +0100
Message-ID: <20181207141739.9085-6-thierry.reding@gmail.com>
References: <20181207141739.9085-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207141739.9085-1-thierry.reding@gmail.com>
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

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.21-arm64-dt

for you to fetch changes up to 611a1c69f8ca85fc656f09d0cd56f5934e2af5fb:

  arm64: tegra: Set reg property for display-hub on Tegra194 (2018-12-07 12:57:26 +0100)

Note that this pulls in a subset of the code that is also part of the
first pull request in this series in order to satisfy some build-time
dependencies.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree change for v4.21-rc1

These changes add a bunch of features for Tegra194 and Tegra186, such as
wake events, on-die RTC, temperature sensors, HDA for audio over HDMI
and fan support on Jetson Xavier to allow cooling of the device.

----------------------------------------------------------------
Dmitry Osipenko (3):
      dt: bindings: tegra20-emc: Document interrupt property
      dt: bindings: tegra20-emc: Document clock property
      dt: bindings: Move tegra20-emc binding to memory-controllers directory

Jon Hunter (2):
      dt-bindings: usb: xhci-tegra: Add power-domain details
      arm64: dts: tegra210: Add power-domains for xHCI

Krishna Reddy (1):
      arm64: dts: tegra186: Enable IOMMU for SDHCI

Sameer Pujar (1):
      arm64: tegra: Add HDA controller on Tegra194

Thierry Reding (30):
      dt-bindings: thermal: tegra-bpmp: Add Tegra194 support
      Merge branch 'for-4.21/dt-bindings' into for-4.21/arm64/dt
      dt-bindings: tegra186-pmc: Add interrupt controller properties
      Merge branch 'for-4.21/dt-bindings' into for-4.21/arm64/dt
      arm64: tegra: Add PWM controllers on Tegra194
      arm64: tegra: Add PWM fan support on Jetson Xavier
      arm64: tegra: Clarify that P2972-0000 is Jetson Xavier
      arm64: tegra: Add display support on Tegra194
      arm64: tegra: Add VIC support on Tegra194
      arm64: tegra: Enable HDMI on P2972-0000
      arm64: tegra: Add thermal zones on Tegra194
      arm64: tegra: p2972: Enable the CPU, GPU and AUX thermal zones
      arm64: tegra: Fix power key interrupt type on Jetson TX2
      arm64: tegra: Enable PMC wake events on Tegra186
      arm64: tegra: Add RTC support on Tegra186
      arm64: tegra: p3310: Enable on-die RTC
      arm64: tegra: Enable PMC wake events on Tegra194
      arm64: tegra: Add RTC support on Tegra194
      arm64: tegra: p2888: Enable on-die RTC
      arm64: tegra: Add AON GPIO controller on Tegra194
      arm64: tegra: Add gpio-keys on Jetson Xavier
      arm64: tegra: Add temperature sensor on P2888
      arm64: tegra: Add HDA controller on Tegra186
      arm64: tegra: Enable HDA on Jetson TX2
      arm64: tegra: Add CEC controller on Tegra186
      arm64: tegra: Enable HDA on Jetson Xavier
      arm64: tegra: Add CEC controller on Tegra194
      arm64: tegra: Enable HDA controller on Jetson TX1
      arm64: tegra: Set reg property for display-hub on Tegra186
      arm64: tegra: Set reg property for display-hub on Tegra194

 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |   3 +
 .../nvidia,tegra20-emc.txt                         |   4 +
 .../thermal/nvidia,tegra186-bpmp-thermal.txt       |   3 +-
 .../bindings/usb/nvidia,tegra124-xusb.txt          |   8 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   6 +
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  45 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  30 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 157 +++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 538 ++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 +
 .../dt-bindings/thermal/tegra194-bpmp-thermal.h    |  15 +
 13 files changed, 813 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt (95%)
 create mode 100644 include/dt-bindings/thermal/tegra194-bpmp-thermal.h
