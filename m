From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v8 00/19] NVIDIA Tegra APB DMA driver fixes and improvements
Date: Sun,  9 Feb 2020 19:33:37 +0300
Message-ID: <20200209163356.6439-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series fixes some problems that I spotted recently, secondly the
driver's code gets a cleanup. Please review and apply, thanks in advance!

Changelog:

v8: - Added RPM-put after every tegra_dma_stop(), like it was suggested by
      Jon Hunter in a review comments to v6/v7. Dropped this patch in a
      result:

        dmaengine: tegra-apb: Don't stop cyclic DMA in a case of error condition

    - Squashed all removals of duplicated pending_sg_req-list-empty checks
      into a single patch and added another removal which was suggested by
      Jon Hunter during review of v7:

        dmaengine: tegra-apb: Remove duplicated pending_sg_req checks

    - Added patch to improve error message about DMA underflow condition,
      which was suggested by Jon Hunter in a review comment to v7:

        dmaengine: tegra-apb: Improve error message about DMA underflow

    - Added another new minor cleanup-patch:

        dmaengine: tegra-apb: Remove unused function argument

v7: - Updated patch "Keep clock enabled only during of DMA transfer" by
      fixing RPM refcount problem of v6 that should happen if oneshot
      transfer is terminated with EOC being set. The patch was change in
      accordance to Jon's Hunter recommendation. In a result there are
      these new small additional patches:

        dmaengine: tegra-apb: Remove handling of unrealistic error condition
        dmaengine: tegra-apb: Don't stop cyclic DMA in a case of error condition

    - Updated commit's message of the "Clean up suspend-resume" patch in
      accordance to Jon's request, now saying that channel's pausing isn't
      supported by the driver.

    - Added new very minor patch to clean up tdc_start_head_req():

        dmaengine: tegra-apb: Remove pending_sg_req checking from tdc_start_head_req

v6: - Added stable tag and changed order of the patch "Prevent race
      conditions of tasklet vs free list", making it patch #2, as was
      requested by Jon Hunter in the review comment to v5.

    - Factored out the tdc->config_init cleanup into separate patch, as was
      requested by Jon Hunter in the review comment to v5:

        dmaengine: tegra-apb: Remove unneeded initialization of tdc->config_init

    - Added new very minor patch to enable compile-testing for the driver:

        dmaengine: tegra-apb: Support COMPILE_TEST

v5: - Fixed touching hardware registers after RPM-suspending in the patch
      "Keep clock enabled only during of DMA transfer", now RPM is kept
      resumed in the tegra_dma_terminate_all() while needed. Thanks to
      Jon Hunter for pointing at this problem in a review comment to v4.

    - The "Clean up runtime PM teardown" patch is replaced with the "Remove
      assumptions about unavailable runtime PM" patch because I recalled that
      now RPM is always available on all Tegra SoCs.

    - The "Clean up suspend-resume" patch got a minor improvement, now
      tasklet_kill() is invoked before checking of the busy state in
      tegra_dma_dev_suspend(), this should allow us to catch problems if DMA
      callback issues a new DMA transfer.

    - Added Jon's acks to the reviewed patches.

v4: - Addressed Jon's request to *not* remove the runtime PM usage, instead
      there is now new patch that makes RPM more practical:

        dmaengine: tegra-apb: Keep clock enabled only during of DMA transfer

    - Added new minor patch to clean up RPM's teardown:

        dmaengine: tegra-apb: Clean up runtime PM teardown

v3: - In the review comment to v1 Michał Mirosław suggested that "Prevent
      race conditions on channel's freeing" does changes that deserve to
      be separated into two patches. I factored out and improved tasklet
      releasing into this new patch:

        dmaengine: tegra-apb: Clean up tasklet releasing

    - The "Fix use-after-free" patch got an improved commit message.

v2: - I took another look at the driver and spotted few more things that
      could be improved, which resulted in these new patches:

        dmaengine: tegra-apb: Remove runtime PM usage
        dmaengine: tegra-apb: Clean up suspend-resume
        dmaengine: tegra-apb: Add missing of_dma_controller_free
        dmaengine: tegra-apb: Allow to compile as a loadable kernel module
        dmaengine: tegra-apb: Remove MODULE_ALIAS

Dmitry Osipenko (19):
  dmaengine: tegra-apb: Fix use-after-free
  dmaengine: tegra-apb: Prevent race conditions of tasklet vs free list
  dmaengine: tegra-apb: Implement synchronization hook
  dmaengine: tegra-apb: Prevent race conditions on channel's freeing
  dmaengine: tegra-apb: Clean up tasklet releasing
  dmaengine: tegra-apb: Use devm_platform_ioremap_resource
  dmaengine: tegra-apb: Use devm_request_irq
  dmaengine: tegra-apb: Fix coding style problems
  dmaengine: tegra-apb: Remove unneeded initialization of
    tdc->config_init
  dmaengine: tegra-apb: Remove assumptions about unavailable runtime PM
  dmaengine: tegra-apb: Remove duplicated pending_sg_req checks
  dmaengine: tegra-apb: Keep clock enabled only during of DMA transfer
  dmaengine: tegra-apb: Clean up suspend-resume
  dmaengine: tegra-apb: Add missing of_dma_controller_free
  dmaengine: tegra-apb: Allow to compile as a loadable kernel module
  dmaengine: tegra-apb: Remove MODULE_ALIAS
  dmaengine: tegra-apb: Support COMPILE_TEST
  dmaengine: tegra-apb: Remove unused function argument
  dmaengine: tegra-apb: Improve error message about DMA underflow

 drivers/dma/Kconfig           |   4 +-
 drivers/dma/tegra20-apb-dma.c | 514 +++++++++++++++++-----------------
 2 files changed, 255 insertions(+), 263 deletions(-)

-- 
2.24.0
