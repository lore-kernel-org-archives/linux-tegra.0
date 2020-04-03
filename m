From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/7] clocksource: Add NVIDIA Tegra186 timers support
Date: Fri,  3 Apr 2020 22:22:02 +0200
Message-ID: <20200403202209.299823-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This set of patches adds the device tree bindings and a simplified
driver for the timers found on Tegra186 and later SoCs. The driver
itself currently only exposes a couple of clock sources and a
watchdog, which in turn relies on the counter provided by one of
the timers. The timers themselves are not used at the moment because
the SoC also has an architected timer and there's currently no use
for the additional timers provided by this hardware block.

I suggest that patches 1 & 2 go through the clocksource tree, while
I can carry the DTS changes in the Tegra tree for v5.8.

Changes in v3:
- request IRQ at the end of ->probe() to avoid potential race condition
- only enable/disable watchdog when it's active
- use _relaxed variants of register accessors
- drop unneeded tegra186_timer.irq field

Changes in v2:
- address review comments on the bindings
- make the driver buildable as a module
- support various clock sources

Thierry

Thierry Reding (7):
  dt-bindings: timer: Add bindings for NVIDIA Tegra186 timers
  clocksource: Add Tegra186 timers support
  arm64: tegra: Order nodes by unit-address on Tegra194
  arm64: tegra: Add native timer support on Tegra186
  arm64: tegra: Enable native timers on Jetson TX2
  arm64: tegra: Add native timer support on Tegra194
  arm64: tegra: Enable native timers on Jetson AGX Xavier

 .../bindings/timer/nvidia,tegra186-timer.yaml |  61 +++
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |   4 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  16 +
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |   4 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  81 +--
 drivers/clocksource/Kconfig                   |   8 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-tegra186.c          | 508 ++++++++++++++++++
 8 files changed, 651 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
 create mode 100644 drivers/clocksource/timer-tegra186.c

-- 
2.24.1
