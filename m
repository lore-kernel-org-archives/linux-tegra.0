From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/3] memory: Introduce NVIDIA Tegra30 EMC driver
Date: Fri, 12 Apr 2019 02:02:18 +0300
Message-ID: <20190411230221.31362-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This patchset adds driver for the External Memory Controller of NVIDIA
Tegra30 SoC's. It performs memory hardware configuration that is required
for changing DRAM frequency, thus providing facility for the memory
frequency scaling on Tegra30. The memory scaling was tested using the
Tegra's devfreq driver which is available in upstream, it dynamically
changes memory clock rate based on memory clients activity.

Dmitry Osipenko (3):
  dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory
    Controller
  memory: tegra: Introduce Tegra30 EMC driver
  ARM: dts: tegra30: Add External Memory Controller node

 .../memory-controllers/nvidia,tegra30-emc.txt |  257 ++++
 arch/arm/boot/dts/tegra30.dtsi                |   11 +
 drivers/memory/tegra/Kconfig                  |   10 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/mc.c                     |    3 -
 drivers/memory/tegra/mc.h                     |   30 +-
 drivers/memory/tegra/tegra30-emc.c            | 1106 +++++++++++++++++
 drivers/memory/tegra/tegra30.c                |   44 +
 8 files changed, 1450 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.txt
 create mode 100644 drivers/memory/tegra/tegra30-emc.c

-- 
2.21.0
