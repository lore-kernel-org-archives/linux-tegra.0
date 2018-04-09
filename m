From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 00/15] Memory controller hot reset
Date: Mon,  9 Apr 2018 22:28:22 +0300
Message-ID: <cover.1523301400.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra's memory controller has a "memory hot reset" functionality that
blocks all memory transactions for the memory client, which is required
for a proper HW resetting. HW could be in process of performing DMA while
being reset and this could lead to a system hang or memory corruption, so
here comes the memory hot reset that blocks all interactions of HW with
memory so that it could be reset safely.

Changelog:

V4:
        Fixed compilation warning about unused function for the case where
        Tegra20 SoC isn't enabled in Kconfig, corrected typos in commit
        messages.

V3:
        Addressed review comments to V2 from Thierry Reding. MC now
        uses generic reset controller API instead of a custom one,
        hence DT changes are now involved and so Rob Herring is CC'd
        for a review.

        Added couple minor cleanup/correction patches.

V2:
        Basically a re-send of V1 with some minor changes.


Dmitry Osipenko (14):
  dt-bindings: arm: tegra: Remove duplicated Tegra30+ MC binding
  dt-bindings: memory: tegra: Document #reset-cells property of the
    Tegra30 MC
  dt-bindings: arm: tegra: Document #reset-cells property of the Tegra20
    MC
  dt-bindings: memory: tegra: Add hot resets definitions
  memory: tegra: Do not handle spurious interrupts
  memory: tegra: Setup interrupts mask before requesting IRQ
  memory: tegra: Apply interrupts mask per SoC
  memory: tegra: Remove unused headers inclusions
  memory: tegra: Squash tegra20-mc into common tegra-mc driver
  memory: tegra: Introduce memory client hot reset
  memory: tegra: Add Tegra124 memory controller hot resets
  memory: tegra: Add Tegra114 memory controller hot resets
  memory: tegra: Add Tegra30 memory controller hot resets
  memory: tegra: Add Tegra20 memory controller hot resets

Thierry Reding (1):
  memory: tegra: Add Tegra210 memory controller hot resets

 .../bindings/arm/tegra/nvidia,tegra20-mc.txt       |  12 +-
 .../bindings/arm/tegra/nvidia,tegra30-mc.txt       |  18 --
 .../memory-controllers/nvidia,tegra30-mc.txt       |   5 +
 drivers/memory/Kconfig                             |  10 -
 drivers/memory/Makefile                            |   1 -
 drivers/memory/tegra/Makefile                      |   1 +
 drivers/memory/tegra/mc.c                          | 358 +++++++++++++++++++--
 drivers/memory/tegra/mc.h                          |  22 ++
 drivers/memory/tegra/tegra114.c                    |  35 ++
 drivers/memory/tegra/tegra124.c                    |  48 +++
 drivers/memory/tegra/tegra20.c                     | 296 +++++++++++++++++
 drivers/memory/tegra/tegra210.c                    |  53 ++-
 drivers/memory/tegra/tegra30.c                     |  35 ++
 drivers/memory/tegra20-mc.c                        | 254 ---------------
 include/dt-bindings/memory/tegra114-mc.h           |  19 ++
 include/dt-bindings/memory/tegra124-mc.h           |  25 ++
 include/dt-bindings/memory/tegra20-mc.h            |  21 ++
 include/dt-bindings/memory/tegra210-mc.h           |  31 ++
 include/dt-bindings/memory/tegra30-mc.h            |  19 ++
 include/soc/tegra/mc.h                             |  37 ++-
 20 files changed, 978 insertions(+), 322 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra30-mc.txt
 create mode 100644 drivers/memory/tegra/tegra20.c
 delete mode 100644 drivers/memory/tegra20-mc.c
 create mode 100644 include/dt-bindings/memory/tegra20-mc.h

-- 
2.16.3
