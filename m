From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 00/39] Introduce memory interconnect for NVIDIA Tegra SoCs
Date: Sun,  7 Jun 2020 21:54:51 +0300
Message-ID: <20200607185530.18113-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series brings initial support for memory interconnect to Tegra20 and
Tegra30 SoCs.

For the starter only display controllers are getting interconnect API
support, others could be supported later on. The display controllers
have the biggest demand for interconnect API right now because dynamic
memory frequency scaling can't be done safely without taking into account
bandwidth requirement from the displays.

Changelog:

v3: - Added acks from Rob Herring that were given to some of the v2 patches.

    - Specified name of the TRM documentation chapter in the patch
      "dt-bindings: host1x: Document new interconnect properties", which was
      suggested by Rob Herring in the review comment to v2.

    - Added patches that allow EMC drivers to be compiled as a loadable kernel
      modules. This came up during of the v2 review when Georgi Djakov pointed
      out that interconnect-core could be compiled as a kernel module. Please
      note that the Tegra124 EMC driver is compile-tested only, I don't have
      Tegra124 HW.

    - In the review comment to [1] Stephen Boyd suggested that it will be
      better not to make changes to clk API, which was needed in order to
      avoid clashing of the interconnect driver with the devfreq in regards
      to memory clk-rate rounding.

      [1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200330231617.17079-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/

      Stephen Boyd suggested that instead we should provide OPP table via DT.
      I tried to investigate whether this could be done and turned out
      it's a bit complicated. Technically it should be doable, but:

        1. For now we don't fully support voltage scaling of the CORE regulator
           and so OPP table in the DT isn't really needed today. We can
           generate table from the memory timings, which is what Tegra devfreq
           drivers already do.

        2. The OPP table should be defined in the DT for the Memory Controller
           node and then its usage somehow should be shared by both interconnect
           and devfreq drivers. It's not obvious what's the best way to do it.

      So, it will be much better to postpone the DT OPP table addition
      until these questions are resolved. We can infer OPPs from the
      memory timings and we could get the memory rates from the memory
      driver directly, avoiding the problems induced by the clk API usage.
      This idea is implemented in v3, see these patches:

        PM / devfreq: tegra20: Use MC timings for building OPP table
        PM / devfreq: tegra30: Use MC timings for building OPP table

v2: - Instead of a single dma-mem interconnect path, the paths are now
      defined per memory client.

    - The EMC provider now uses #interconnect-cells=<0>.

    - Dropped Tegra124 because there is no enough information about how to
      properly calculate required EMC clock rate for it and I don't have
      hardware for testing. Somebody else will have to work on it.

    - Moved interconnect providers code into drivers/memory/tegra/*.

    - Added "Create tegra20-devfreq device" patch because interconnect
      is not very usable without the devfreq memory auto-scaling since
      memory freq will be fixed to the display's requirement.

Artur Świgoń (1):
  interconnect: Relax requirement in of_icc_get_from_provider()

Dmitry Osipenko (38):
  clk: Export clk_hw_reparent()
  clk: tegra: Remove Memory Controller lock
  clk: tegra: Export Tegra20 EMC kernel symbols
  memory: tegra20-emc: Make driver modular
  memory: tegra30-emc: Make driver modular
  memory: tegra124-emc: Make driver modular
  memory: tegra124-emc: Use devm_platform_ioremap_resource
  soc/tegra: fuse: Export tegra_read_ram_code()
  memory: tegra20-emc: Initialize MC timings
  PM / devfreq: tegra20: Silence deferred probe error
  PM / devfreq: tegra30: Silence deferred probe error
  PM / devfreq: tegra20: Use MC timings for building OPP table
  PM / devfreq: tegra30: Use MC timings for building OPP table
  PM / devfreq: tegra20: Add error messages to tegra_devfreq_target()
  PM / devfreq: tegra30: Add error messages to tegra_devfreq_target()
  PM / devfreq: tegra20: Adjust clocks conversion ratio and polling
    interval
  PM / devfreq: tegra20: Relax Kconfig dependency
  dt-bindings: memory: tegra20: mc: Document new interconnect property
  dt-bindings: memory: tegra20: emc: Document new interconnect property
  dt-bindings: memory: tegra30: mc: Document new interconnect property
  dt-bindings: memory: tegra30: emc: Document new interconnect property
  dt-bindings: host1x: Document new interconnect properties
  dt-bindings: memory: tegra20: Add memory client IDs
  dt-bindings: memory: tegra30: Add memory client IDs
  ARM: tegra: Add interconnect properties to Tegra20 device-tree
  ARM: tegra: Add interconnect properties to Tegra30 device-tree
  memory: tegra: Register as interconnect provider
  memory: tegra20-emc: Use devm_platform_ioremap_resource
  memory: tegra20-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra20-emc: Register as interconnect provider
  memory: tegra20-emc: Create tegra20-devfreq device
  memory: tegra30-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra30-emc: Register as interconnect provider
  drm/tegra: dc: Support memory bandwidth management
  drm/tegra: dc: Tune up high priority request controls for Tegra20
  drm/tegra: dc: Extend debug stats with total number of events
  ARM: tegra: Enable interconnect API in tegra_defconfig
  ARM: multi_v7_defconfig: Enable interconnect API

 .../display/tegra/nvidia,tegra20-host1x.txt   |  68 +++++
 .../memory-controllers/nvidia,tegra20-emc.txt |   2 +
 .../memory-controllers/nvidia,tegra20-mc.txt  |   3 +
 .../nvidia,tegra30-emc.yaml                   |   6 +
 .../memory-controllers/nvidia,tegra30-mc.yaml |   5 +
 arch/arm/boot/dts/tegra20.dtsi                |  22 +-
 arch/arm/boot/dts/tegra30.dtsi                |  23 +-
 arch/arm/configs/multi_v7_defconfig           |   1 +
 arch/arm/configs/tegra_defconfig              |   1 +
 drivers/clk/clk.c                             |   1 +
 drivers/clk/tegra/clk-divider.c               |   4 +-
 drivers/clk/tegra/clk-tegra114.c              |   6 +-
 drivers/clk/tegra/clk-tegra124-emc.c          |  63 ++--
 drivers/clk/tegra/clk-tegra124.c              |   8 +-
 drivers/clk/tegra/clk-tegra20-emc.c           |   3 +
 drivers/clk/tegra/clk-tegra20.c               |   3 +-
 drivers/clk/tegra/clk-tegra30.c               |   3 +-
 drivers/clk/tegra/clk.h                       |  14 +-
 drivers/devfreq/Kconfig                       |   2 +-
 drivers/devfreq/tegra20-devfreq.c             |  52 ++--
 drivers/devfreq/tegra30-devfreq.c             | 115 +++++--
 drivers/gpu/drm/tegra/dc.c                    | 289 +++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h                    |  13 +
 drivers/gpu/drm/tegra/drm.c                   |  19 ++
 drivers/gpu/drm/tegra/plane.c                 |   1 +
 drivers/gpu/drm/tegra/plane.h                 |   4 +-
 drivers/interconnect/core.c                   |  11 +-
 drivers/memory/tegra/Kconfig                  |   6 +-
 drivers/memory/tegra/mc.c                     | 121 ++++++++
 drivers/memory/tegra/mc.h                     |   8 +
 drivers/memory/tegra/tegra124-emc.c           |  35 ++-
 drivers/memory/tegra/tegra20-emc.c            | 219 +++++++++++--
 drivers/memory/tegra/tegra30-emc.c            | 160 ++++++++--
 drivers/soc/tegra/fuse/tegra-apbmisc.c        |   2 +
 include/dt-bindings/memory/tegra20-mc.h       |  53 ++++
 include/dt-bindings/memory/tegra30-mc.h       |  67 ++++
 include/linux/clk/tegra.h                     |  11 +
 include/soc/tegra/emc.h                       |  16 -
 include/soc/tegra/mc.h                        |   3 +
 39 files changed, 1245 insertions(+), 198 deletions(-)
 delete mode 100644 include/soc/tegra/emc.h

-- 
2.26.0
