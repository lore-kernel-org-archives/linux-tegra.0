From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH v2 0/6] Device tree updates for host1x support
Date: Thu, 15 Nov 2012 22:07:53 +0100
Message-ID: <1353013679-16773-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This second version of this patch series splits the patches up into more
logical chunks as requested by Stephen. Instead of renaming the matching
parameters in the clock driver, this version renames the AUXDATA entries
to match what the clock driver expects. Furthermore the host1x clock is
initialized to 150 MHz instead of the unsupported 144 MHz.

Thierry

Thierry Reding (6):
  ARM: tegra: Add Tegra20 host1x support
  ARM: tegra: Add AUXDATA for Tegra20 host1x
  ARM: tegra: Add Tegra20 host1x clock support
  ARM: tegra: Add Tegra30 host1x support
  ARM: tegra: Add AUXDATA for Tegra30 host1x
  ARM: tegra: Add Tegra30 host1x clock support

 arch/arm/boot/dts/tegra20.dtsi            | 87 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi            | 87 +++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-dt-tegra20.c    |  9 ++++
 arch/arm/mach-tegra/board-dt-tegra30.c    |  9 ++++
 arch/arm/mach-tegra/tegra20_clocks_data.c | 11 ++--
 arch/arm/mach-tegra/tegra30_clocks_data.c |  5 +-
 6 files changed, 203 insertions(+), 5 deletions(-)

-- 
1.8.0
