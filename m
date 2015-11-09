From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 0/6] DMA: tegra-apb: Clean-up
Date: Mon, 9 Nov 2015 13:23:43 +0000
Message-ID: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Some clean-up changes for the tegra-apb DMA driver.

These have been compile and boot tested for ARM and ARM64. Summary of the
ARM results are below.

Test summary
------------

Build: zImage:
    Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Build: Image:
    Pass: ( 1/ 1): defconfig

Boot to userspace: defconfig:
    Pass: ( 1/ 1): qemu-vexpress64

Boot to userspace: multi_v7_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
                   tegra20-trimslice, tegra30-beaver

Boot to userspace: tegra_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
                   tegra20-trimslice, tegra30-beaver

Jon Hunter (6):
  dmaengine: tegra-apb: Correct runtime-pm usage
  dmaengine: tegra-apb: Use dev_get_drvdata()
  dmaengine: tegra-apb: Save and restore word count
  dmaengine: tegra-apb: Only save channel state for those in use
  dmaengine: tegra-apb: Update driver to use GFP_NOWAIT
  dmaengine: tegra-apb: Free interrupts before killing tasklets

 drivers/dma/tegra20-apb-dma.c | 83 ++++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 37 deletions(-)

-- 
2.1.4
