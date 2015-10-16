From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/6] dmaengine: tegra-apb: Various updates
Date: Fri, 16 Oct 2015 09:25:51 +0100
Message-ID: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

A few updates for the tegra-apb driver. Build tested for ARM and ARM64 and
the driver has been tested on tegra124 with the HSUART driver that uses
DMA.

Jon Hunter (6):
  dmaengine: tegra-apb: Correct runtime-pm usage
  dmaengine: tegra-apb: Use dev_get_drvdata()
  dmaengine: tegra-apb: Save and restore word count
  dmaengine: tegra-apb: Only save channel state for those in use
  dmaengine: tegra-apb: Update driver to use GFP_NOWAIT
  dmaengine: tegra-apb: Disable interrupts on removal

 drivers/dma/tegra20-apb-dma.c | 79 ++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 38 deletions(-)

-- 
2.1.4
