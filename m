From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] clocksource: Add NVIDIA Tegra186 timers support
Date: Fri, 20 Mar 2020 14:34:45 +0100
Message-ID: <20200320133452.3705040-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This set of patches adds the device tree bindings and a simplified
driver for the timers found on Tegra186 and later SoCs. The driver
itself currently only implements a single watchdog, which in turn
relies on the counter provided by one of the timers. The timers
themselves are not used at the moment because the SoC also has an
architected timer and there's currently no use for the additional
timers provided by this hardware block.

I suggest that patches 1 & 2 go through the clocksource tree, while
I can carry the DTS changes in the Tegra tree for v5.8.

Thierry

Thierry Reding (7):
  dt-bindings: timer: Add bindings for NVIDIA Tegra186 timers
  clocksource: Add Tegra186 timers support
  arm64: tegra: Order nodes by unit-address on Tegra194
  arm64: tegra: Add native timer support on Tegra186
  arm64: tegra: Enable native timers on Jetson TX2
  arm64: tegra: Add native timer support on Tegra194
  arm64: tegra: Enable native timers on Jetson AGX Xavier

 .../bindings/timer/nvidia,tegra186-timer.yaml |  55 +++
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |   4 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  16 +
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |   4 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  81 ++--
 drivers/clocksource/Kconfig                   |   8 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-tegra186.c          | 377 ++++++++++++++++++
 8 files changed, 514 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
 create mode 100644 drivers/clocksource/timer-tegra186.c

-- 
2.24.1
