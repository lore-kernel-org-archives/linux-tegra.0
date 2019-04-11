From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/4] memory: tegra: Fix memory arbitration programming
Date: Fri, 12 Apr 2019 01:12:46 +0300
Message-ID: <20190411221250.23233-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello, this series properly addresses the bugged memory arbitration
programming and in result the previous suspend-resume workaround change
is reverted as it was not entirely correct.

Dmitry Osipenko (4):
  memory: tegra: Fix missed registers values latching
  memory: tegra: Fix integer overflow on tick value calculation
  memory: tegra: Replace readl-writel with mc_readl-mc_writel
  Revert "ARM: tegra: Restore memory arbitration on resume from LP1 on
    Tegra30+"

 arch/arm/mach-tegra/iomap.h         |  9 ---------
 arch/arm/mach-tegra/sleep-tegra30.S | 21 ---------------------
 drivers/memory/tegra/mc.c           | 16 +++++++++++-----
 3 files changed, 11 insertions(+), 35 deletions(-)

-- 
2.21.0
