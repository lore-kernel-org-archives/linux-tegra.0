From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 00/29] Introduce memory interconnect for NVIDIA Tegra SoCs
Date: Mon, 18 Nov 2019 23:02:18 +0300
Message-ID: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series brings initial support for memory interconnect to Tegra20,
Terga30 and Tegra124 SoCs. The interconnect provides are quite generic
and should be suitable for all Tegra SoCs, but currently upstream kernel
has EMC/MC drivers only for those three generations of Tegra SoCs.

For the start only display controllers are getting interconnect API
support, others could be supported later on. The display controllers
have the biggest demand for interconnect API right now because dynamic
memory frequency scaling can't be done safely without taking into account
bandwidth requirement from the displays.

Dmitry Osipenko (29):
  dt-bindings: memory: tegra20: mc: Document new interconnect property
  dt-bindings: memory: tegra20: emc: Document new interconnect property
  dt-bindings: memory: tegra30: mc: Document new interconnect property
  dt-bindings: memory: tegra30: emc: Document new interconnect property
  dt-bindings: memory: tegra124: mc: Document new interconnect property
  dt-bindings: memory: tegra124: emc: Document new interconnect property
  dt-bindings: host1x: Document new interconnect properties
  dt-bindings: interconnect: tegra: Add initial IDs
  ARM: tegra: Add interconnect properties to Tegra20 device-tree
  ARM: tegra: Add interconnect properties to Tegra30 device-tree
  ARM: tegra: Add interconnect properties to Tegra124 device-tree
  interconnect: Add memory interconnection providers for NVIDIA Tegra
    SoCs
  memory: tegra: Register as interconnect provider
  memory: tegra: Add interconnect nodes for Terga20 display controllers
  memory: tegra: Add interconnect nodes for Terga30 display controllers
  memory: tegra: Add interconnect nodes for Terga124 display controllers
  memory: tegra20-emc: Use devm_platform_ioremap_resource
  memory: tegra20-emc: Continue probing if timings/IRQ are missing in
    device-tree
  memory: tegra20-emc: Register as interconnect provider
  memory: tegra30-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra30-emc: Register as interconnect provider
  memory: tegra124-emc: Use devm_platform_ioremap_resource
  memory: tegra124-emc: Register as interconnect provider
  drm/tegra: dc: Use devm_platform_ioremap_resource
  drm/tegra: dc: Release PM and RGB output when client's registration
    fails
  drm/tegra: dc: Support memory bandwidth management
  ARM: tegra: Enable interconnect API in tegra_defconfig
  ARM: multi_v7_defconfig: Enable NVIDIA Tegra interconnect providers
  MAINTAINERS: Add maintainers for NVIDIA Tegra interconnect drivers

 .../display/tegra/nvidia,tegra20-host1x.txt   |  67 +++++
 .../nvidia,tegra124-emc.txt                   |   3 +
 .../nvidia,tegra124-mc.yaml                   |   5 +
 .../memory-controllers/nvidia,tegra20-emc.txt |   4 +
 .../memory-controllers/nvidia,tegra20-mc.txt  |   4 +
 .../nvidia,tegra30-emc.yaml                   |   6 +
 .../memory-controllers/nvidia,tegra30-mc.yaml |   5 +
 MAINTAINERS                                   |   9 +
 arch/arm/boot/dts/tegra124.dtsi               |  10 +
 arch/arm/boot/dts/tegra20.dtsi                |  11 +-
 arch/arm/boot/dts/tegra30.dtsi                |  12 +-
 arch/arm/configs/multi_v7_defconfig           |   2 +
 arch/arm/configs/tegra_defconfig              |   2 +
 drivers/gpu/drm/tegra/dc.c                    | 252 +++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h                    |   8 +
 drivers/gpu/drm/tegra/drm.c                   |  18 ++
 drivers/gpu/drm/tegra/plane.c                 |   1 +
 drivers/gpu/drm/tegra/plane.h                 |   4 +-
 drivers/interconnect/Kconfig                  |   1 +
 drivers/interconnect/Makefile                 |   1 +
 drivers/interconnect/tegra/Kconfig            |   6 +
 drivers/interconnect/tegra/Makefile           |   4 +
 drivers/interconnect/tegra/tegra-icc-emc.c    | 138 ++++++++++
 drivers/interconnect/tegra/tegra-icc-mc.c     | 130 +++++++++
 drivers/memory/tegra/mc.c                     |   4 +
 drivers/memory/tegra/tegra124-emc.c           |  28 +-
 drivers/memory/tegra/tegra124.c               |  16 ++
 drivers/memory/tegra/tegra20-emc.c            |  91 ++++---
 drivers/memory/tegra/tegra20.c                |  14 +
 drivers/memory/tegra/tegra30-emc.c            |  34 ++-
 drivers/memory/tegra/tegra30.c                |  14 +
 include/dt-bindings/interconnect/tegra-icc.h  |  11 +
 include/soc/tegra/mc.h                        |  26 ++
 33 files changed, 883 insertions(+), 58 deletions(-)
 create mode 100644 drivers/interconnect/tegra/Kconfig
 create mode 100644 drivers/interconnect/tegra/Makefile
 create mode 100644 drivers/interconnect/tegra/tegra-icc-emc.c
 create mode 100644 drivers/interconnect/tegra/tegra-icc-mc.c
 create mode 100644 include/dt-bindings/interconnect/tegra-icc.h

-- 
2.23.0
