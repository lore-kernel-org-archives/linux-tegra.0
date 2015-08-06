From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/4] DMA: tegra-apb: Clean-up
Date: Thu, 6 Aug 2015 14:32:29 +0100
Message-ID: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Some clean-up changes for the tegra-apb DMA driver.

These have been compile and boot tested for ARM and ARM64. Summary of the
ARM results are below. ARM64 has been tested locally.

Test summary
------------

Build: zImage:
    Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Boot to userspace: multi_v7_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
                   tegra20-trimslice, tegra30-beaver

Boot to userspace: tegra_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
                   tegra20-trimslice, tegra30-beaver

Jon Hunter (4):
  DMA: tegra-apb: Remove unused variables
  DMA: tegra-apb: Avoid unnecessary channel base address calculation
  DMA: tegra-apb: Remove unnecessary return statements and variables
  DMA: tegra-apb: Simplify locking for device using global pause

 drivers/dma/tegra20-apb-dma.c | 63 ++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 25 deletions(-)

-- 
2.1.4
