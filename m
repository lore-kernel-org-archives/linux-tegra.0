From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/5] Tegra20 External Memory Controller driver
Date: Mon,  4 Jun 2018 01:36:49 +0300
Message-ID: <20180603223654.23324-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

Couple years ago the Tegra20 EMC driver was removed from the kernel
due to incompatible changes in the Tegra's clock driver. This patchset
introduces a modernized EMC driver. Currently the sole purpose of the
driver is to initialize DRAM frequency to maximum rate during of the
kernels boot-up. Later we may consider implementing dynamic memory
frequency scaling, utilizing functionality provided by this driver.

Changelog:

v2:
	- Minor code cleanups like consistent use of writel_relaxed instead
	  of non-relaxed version, reworded error messages, etc.

	- Factored out use_pllm_ud bit checking into a standalone patch for
	  consistency.

Dmitry Osipenko (5):
  dt: bindings: tegra20-emc: Document interrupt property
  ARM: dts: tegra20: Add interrupt to External Memory Controller
  clk: tegra20: Turn EMC clock gate into divider
  clk: tegra20: Check whether direct PLLM sourcing is turned off for EMC
  memory: tegra: Introduce Tegra20 EMC driver

 .../bindings/arm/tegra/nvidia,tegra20-emc.txt |   2 +
 arch/arm/boot/dts/tegra20.dtsi                |   1 +
 drivers/clk/tegra/clk-tegra20.c               |  46 +-
 drivers/memory/tegra/Kconfig                  |  10 +
 drivers/memory/tegra/Makefile                 |   1 +
 drivers/memory/tegra/tegra20-emc.c            | 586 ++++++++++++++++++
 6 files changed, 636 insertions(+), 10 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra20-emc.c

-- 
2.17.0
