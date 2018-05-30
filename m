From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/4] Tegra20 External Memory Controller driver
Date: Wed, 30 May 2018 18:06:42 +0300
Message-ID: <20180530150646.19030-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

Couple years ago the Tegra20 EMC driver was removed from the kernel
due to incompatible changes in the Tegra's clock driver. This patchset
introduces a modernized EMC driver. Currently the sole purpose of the
driver is to initialize DRAM frequency to maximum rate during of the
kernels boot-up. Later we may consider implementing dynamic memory
frequency scaling, utilizing functionality provided by this driver.

Dmitry Osipenko (4):
  dt: bindings: tegra20-emc: Document interrupt property
  ARM: dts: tegra20: Add interrupt to External Memory Controller
  clk: tegra20: Turn EMC clock gate into divider
  memory: tegra: Introduce Tegra20 EMC driver

 .../bindings/arm/tegra/nvidia,tegra20-emc.txt |   2 +
 arch/arm/boot/dts/tegra20.dtsi                |   1 +
 drivers/clk/tegra/clk-tegra20.c               |  39 +-
 drivers/memory/tegra/Kconfig                  |  10 +
 drivers/memory/tegra/Makefile                 |   1 +
 drivers/memory/tegra/tegra20-emc.c            | 573 ++++++++++++++++++
 6 files changed, 616 insertions(+), 10 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra20-emc.c

-- 
2.17.0
