From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/4] i2c: tegra: required clock support for controller
Date: Wed, 8 Aug 2012 13:21:30 +0530
Message-ID: <1344412294-2420-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, w.sang@pengutronix.de, olof@lixom.net, khali@linux-fr.org
Cc: ben-linux@fluff.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra's i2c controller required two clock sources for proper
operation named as div-clk and fast-clk.

Adding support to make sure that driver will get these clocks and 
enable before any transfer and disable after transfer completed.

Patch 1 add the entry of fast clock in clock table.
Patch 2 modify i2c driver to get the div and fast clock.
Patch 3 name the connection of the clock entry.
Patch 4 removes non-required entry from tegra20 clock table.

Laxman Dewangan (4):
  ARM: tegra: clock: add i2c fast clock entry in clock table
  i2c: tegra: pass proper name for getting clock
  ARM: tegra: clock: add connection name in i2c clock entry
  ARM: tegra: clock: remove unused clock entry for i2c

 arch/arm/mach-tegra/tegra20_clocks_data.c |   20 +++++-------
 arch/arm/mach-tegra/tegra30_clocks_data.c |   15 ++++++---
 drivers/i2c/busses/i2c-tegra.c            |   46 ++++++++++++++--------------
 3 files changed, 41 insertions(+), 40 deletions(-)
