From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 00/12] dma: various minor clean ups for slave drivers
Date: Mon, 27 May 2013 15:14:30 +0300
Message-ID: <1369656882-25241-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Shawn Guo <shawn.guo@linaro.org>, Zhang Wei <zw@zh-kernel.org>, linux-tegra@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
List-Id: linux-tegra@vger.kernel.org

Here is a set of small independent patches that clean up or fix minor things
across DMA slave drivers.

Andy Shevchenko (12):
  imx-sdma: remove useless variable
  mxs-dma: remove useless variable
  edma: no need to assign residue to 0 explicitly
  ep93xx_dma: remove useless use of lock
  fsldma: remove useless use of lock
  mmp_pdma: remove useless use of lock
  mpc512x_dma: remove useless use of lock
  pch_dma: remove useless use of lock
  tegra20-apb-dma: remove useless use of lock
  ipu_idmac: re-use dma_cookie_status()
  mmp_tdma: set cookies as well when asked for tx status
  txx9dmac: return DMA_SUCCESS immediately from device_tx_status()

 drivers/dma/edma.c            |  2 --
 drivers/dma/ep93xx_dma.c      | 10 +---------
 drivers/dma/fsldma.c          | 10 +---------
 drivers/dma/imx-sdma.c        |  9 +++------
 drivers/dma/ipu/ipu_idmac.c   |  5 +----
 drivers/dma/mmp_pdma.c        | 10 +---------
 drivers/dma/mmp_tdma.c        |  3 ++-
 drivers/dma/mpc512x_dma.c     | 10 +---------
 drivers/dma/mxs-dma.c         |  4 +---
 drivers/dma/pch_dma.c         |  9 +--------
 drivers/dma/tegra20-apb-dma.c |  8 +++-----
 drivers/dma/txx9dmac.c        | 13 ++++++-------
 12 files changed, 21 insertions(+), 72 deletions(-)

-- 
1.8.2.rc0.22.gb3600c3
