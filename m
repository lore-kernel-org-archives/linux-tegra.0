From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/8] Add EMC scaling support for Tegra210
Date: Tue, 10 Mar 2020 16:19:55 +0100
Message-ID: <20200310152003.2945170-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This series introduces the EMC clock scaling support for Tegra210. The
EMC table of supported frequencies is passed to the kernel via a device
tree reserved memory region.

Joseph posted the v4 of this series[0] about a year ago. I've dusted it
off a bit and tried to address all of the comments that Dmitry had made
in response to v4.

Changes in v4:
- major rework to split this into a clk driver and an EMC driver
- refactored some code to remove duplication and improve readability
- removed some unused code and variables

Thierry

[0]: https://lore.kernel.org/linux-arm-kernel/20190529082139.5581-1-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/

Joseph Lo (8):
  clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
  clk: tegra: Export functions for EMC clock scaling
  clk: tegra: Implement Tegra210 EMC clock
  dt-bindings: memory: tegra: Add external memory controller binding for
    Tegra210
  memory: tegra: Add EMC scaling support code for Tegra210
  memory: tegra: Add EMC scaling sequence code for Tegra210
  arm64: tegra: Add external memory controller node for Tegra210
  clk: tegra: Remove the old emc_mux clock for Tegra210

 .../nvidia,tegra210-emc.yaml                  |   83 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |   11 +
 drivers/clk/tegra/Makefile                    |    1 +
 drivers/clk/tegra/clk-tegra210-emc.c          |  352 ++++
 drivers/clk/tegra/clk-tegra210.c              |   83 +-
 drivers/clk/tegra/clk.h                       |    3 +
 drivers/memory/tegra/Kconfig                  |   10 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1782 ++++++++++++++++
 drivers/memory/tegra/tegra210-emc.c           | 1800 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc.h           | 1065 ++++++++++
 include/dt-bindings/clock/tegra210-car.h      |    4 +-
 include/linux/clk/tegra.h                     |   26 +
 13 files changed, 5202 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
 create mode 100644 drivers/clk/tegra/clk-tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h

-- 
2.24.1
