From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 00/14] Add EMC scaling support for Tegra210
Date: Thu,  9 Apr 2020 19:52:24 +0200
Message-ID: <20200409175238.3586487-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This series introduces the EMC clock scaling support for Tegra210. The
EMC table of supported frequencies is passed to the kernel via a device
tree reserved memory region.

Joseph posted the v4 of this series[0] about a year ago. I've dusted it
off a bit and tried to address all of the comments that Dmitry had made
in response to v4.

Changes in v6:
- add support for derated tables which are used under high temperatures
- add patches to support memory-region-names property in DT
- address review comments

Changes in v5:
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

Thierry Reding (6):
  dt-bindings: reserved-memory: Introduce memory-region-names
  of: reserved-memory: Support lookup of regions by name
  of: reserved-memory: Support multiple regions per device
  clk: tegra: Rename Tegra124 EMC clock source file
  memory: tegra: Support derated timings on Tegra210
  arm64: tegra: Hook up EMC cooling device

 .../nvidia,tegra210-emc.yaml                  |   82 +
 .../reserved-memory/reserved-memory.txt       |    2 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |   37 +-
 drivers/clk/tegra/Makefile                    |    3 +-
 .../tegra/{clk-emc.c => clk-tegra124-emc.c}   |    0
 drivers/clk/tegra/clk-tegra210-emc.c          |  369 +++
 drivers/clk/tegra/clk-tegra210.c              |   87 +-
 drivers/clk/tegra/clk.h                       |    3 +
 drivers/memory/tegra/Kconfig                  |   14 +
 drivers/memory/tegra/Makefile                 |    4 +
 drivers/memory/tegra/mc.h                     |    1 +
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1744 ++++++++++++++
 drivers/memory/tegra/tegra210-emc-core.c      | 2099 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc-table.c     |   94 +
 drivers/memory/tegra/tegra210-emc.h           | 1023 ++++++++
 drivers/memory/tegra/tegra210-mc.h            |   49 +
 drivers/of/of_reserved_mem.c                  |   41 +-
 include/dt-bindings/clock/tegra210-car.h      |    4 +-
 include/linux/clk/tegra.h                     |   27 +
 include/linux/of_reserved_mem.h               |   11 +
 20 files changed, 5656 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
 rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)
 create mode 100644 drivers/clk/tegra/clk-tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-core.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-table.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h
 create mode 100644 drivers/memory/tegra/tegra210-mc.h

-- 
2.24.1
