From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 00/22] Introduce memory interconnect for NVIDIA Tegra SoCs
Date: Mon, 30 Mar 2020 04:08:42 +0300
Message-ID: <20200330010904.27643-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series brings initial support for memory interconnect to Tegra20 and
Tegra30 SoCs. The interconnect provides are quite generic and should be
suitable for all Tegra SoCs, but currently support is added only for these
two generations of Tegra SoCs.

For the starter only display controllers are getting interconnect API
support, others could be supported later on. The display controllers
have the biggest demand for interconnect API right now because dynamic
memory frequency scaling can't be done safely without taking into account
bandwidth requirement from the displays.

(!) Please note that the EMC patches are made on top of the other EMC
    patches [1][2] that I was sending out recently.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=164165
[2] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=165451

Changelog:

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

Dmitry Osipenko (21):
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
 drivers/gpu/drm/tegra/dc.c                    | 289 +++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h                    |  13 +
 drivers/gpu/drm/tegra/drm.c                   |  19 ++
 drivers/gpu/drm/tegra/plane.c                 |   1 +
 drivers/gpu/drm/tegra/plane.h                 |   4 +-
 drivers/interconnect/core.c                   |  11 +-
 drivers/memory/tegra/mc.c                     | 118 +++++++
 drivers/memory/tegra/mc.h                     |   8 +
 drivers/memory/tegra/tegra20-emc.c            | 161 ++++++++--
 drivers/memory/tegra/tegra30-emc.c            | 144 ++++++++-
 include/dt-bindings/memory/tegra20-mc.h       |  53 ++++
 include/dt-bindings/memory/tegra30-mc.h       |  67 ++++
 include/soc/tegra/mc.h                        |   3 +
 22 files changed, 975 insertions(+), 47 deletions(-)

-- 
2.25.1
