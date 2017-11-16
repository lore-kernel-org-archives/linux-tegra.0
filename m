From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 0/8] Tegra210 DFLL implementation
Date: Thu, 16 Nov 2017 17:33:01 +0200
Message-ID: <1510846389-28712-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series introduces support for the DFLL as a CPU clock source
on Tegra210. As Jetson TX2 uses a PWM controlled regulator which
is driven directly by the DFLLs PWM output, we also introduce support
for PWM regulators next to I2C controlled regulators. Because the
regulator voltage directly changes the DFLL output frequency and
the registers for controlling the PWM output are part of the DFLL
IP block, we don't model a seperate regulator object for this
PWM regulator, but instead control it directly from withing the
DFLL driver.

Peter De Schrijver (8):
  clk: tegra: dfll registration for multiple SoCs
  clk: tegra: DT align parameter for CVB calculation
  clk: tegra: add CVB tables for Tegra210 CPU DFLL
  clk: tegra: dfll: support PWM regulator control
  clk: tegra: build clk-dfll.c for Tegra124 and Tegra210
  cpufreq: tegra124-cpufreq: extend to support Tegra210
  arm64: dts: tegra: Add Tegra210 DFLL definition
  arm64: dts: nvidia: Tegra210 CPU clock definition

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  20 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  12 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       |  27 ++
 drivers/clk/tegra/Kconfig                      |   5 +
 drivers/clk/tegra/Makefile                     |   2 +-
 drivers/clk/tegra/clk-dfll.c                   | 481 ++++++++++++++++++++----
 drivers/clk/tegra/clk-dfll.h                   |   7 +
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c     | 492 ++++++++++++++++++++++++-
 drivers/clk/tegra/cvb.c                        |  17 +-
 drivers/clk/tegra/cvb.h                        |   6 +-
 drivers/cpufreq/tegra124-cpufreq.c             |  13 +-
 11 files changed, 978 insertions(+), 104 deletions(-)

-- 
1.9.1

