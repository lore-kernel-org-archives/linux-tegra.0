From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 08/10] arm64: tegra: Device tree changes for v5.7-rc1
Date: Fri, 13 Mar 2020 17:58:46 +0100
Message-ID: <20200313165848.2915133-8-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200313165848.2915133-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm64-dt

for you to fetch changes up to 84eaaf7500036f292f5563b39a983c492d5b12ae:

  arm64: tegra: Add support for PCIe endpoint mode in P2972-0000 platform (2020-03-12 12:14:31 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.7-rc1

These changes add support for the XUSB pad controller, as well as the
XUSB controller on Tegra194. Furthermore, USB device mode is supported
across Tegra210 and Tegra186 boards. PCIe endpoint mode support is added
for the Jetson AGX Xavier platform.

Various minor fixes eliminate warnings on boot related to missing power
supplies for some devices.

----------------------------------------------------------------
JC Kuo (2):
      arm64: tegra: Add XUSB and pad controller on Tegra194
      arm64: tegra: Enable XUSB host in P2972-0000 board

Jon Hunter (5):
      arm64: tegra: Fix Tegra194 PCIe compatible string
      arm64: tegra: Enable I2C controller for EEPROM
      arm64: tegra: Add EEPROM supplies
      arm64: tegra: Fix Tegra186 SOR supply
      arm64: tegra: Populate LP8557 backlight regulator

Nagarjuna Kristam (8):
      arm64: tegra: Update OTG port entries for Jetson TX1
      arm64: tegra: Update OTG port entries for Jetson TX2
      arm64: tegra: Add XUDC node for Tegra210
      arm64: tegra: Enable XUDC on Jetson TX1
      arm64: tegra: Add XUDC node for Tegra186
      arm64: tegra: Enable XUDC node on Jetson TX2
      arm64: tegra: Update OTG port entries for Jetson Nano
      arm64: tegra: Enable XUDC node on Jetson Nano

Sowjanya Komatineni (6):
      dt-bindings: clock: tegra: Add IDs for OSC clocks
      dt-bindings: tegra: Convert Tegra PMC bindings to YAML
      dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
      dt-bindings: soc: tegra-pmc: Add ID for Tegra PMC 32 kHz blink clock
      arm64: tegra: Add clock-cells property to Tegra PMC node
      arm64: tegra: smaug: Change clk_out_2 provider to PMC

Thierry Reding (2):
      Merge branch 'for-5.7/dt-bindings' into for-5.7/arm64/dt
      arm64: tegra: Add ethernet alias on Jetson TX1

Vidya Sagar (2):
      arm64: tegra: Add PCIe endpoint controllers nodes for Tegra194
      arm64: tegra: Add support for PCIe endpoint mode in P2972-0000 platform

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 -----------------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++++++++++++
 .../bindings/pci/nvidia,tegra194-pcie.txt          |   2 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  26 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  19 ++
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  36 ++-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  81 +++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 250 ++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   3 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   2 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  45 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  24 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  25 +-
 include/dt-bindings/clock/tegra114-car.h           |   4 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   4 +-
 include/dt-bindings/clock/tegra210-car.h           |   4 +-
 include/dt-bindings/clock/tegra30-car.h            |   4 +-
 include/dt-bindings/soc/tegra-pmc.h                |  16 +
 21 files changed, 883 insertions(+), 323 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h
