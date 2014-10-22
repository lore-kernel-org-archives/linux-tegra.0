From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 43/59] dmaengine: tegra20: Split device_control
Date: Wed, 22 Oct 2014 17:43:57 +0200
Message-ID: <1413992653-21963-44-git-send-email-maxime.ripard@free-electrons.com>
References: <1413992653-21963-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1413992653-21963-1-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, lars@metafoo.de, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-tegra@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine@free-electrons.com>
List-Id: linux-tegra@vger.kernel.org

Split the device_control callback of the NVidia Tegra20 APB DMA driver to make
use of the newly introduced callbacks, that will eventually be used to retrieve
slave capabilities.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/dma/tegra20-apb-dma.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 16efa603ff65..dea6b78080aa 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -827,25 +827,6 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
 	return ret;
 }
 
-static int tegra_dma_device_control(struct dma_chan *dc, enum dma_ctrl_cmd cmd,
-			unsigned long arg)
-{
-	switch (cmd) {
-	case DMA_SLAVE_CONFIG:
-		return tegra_dma_slave_config(dc,
-				(struct dma_slave_config *)arg);
-
-	case DMA_TERMINATE_ALL:
-		tegra_dma_terminate_all(dc);
-		return 0;
-
-	default:
-		break;
-	}
-
-	return -ENXIO;
-}
-
 static inline int get_bus_width(struct tegra_dma_channel *tdc,
 		enum dma_slave_buswidth slave_bw)
 {
@@ -1443,7 +1424,8 @@ static int tegra_dma_probe(struct platform_device *pdev)
 					tegra_dma_free_chan_resources;
 	tdma->dma_dev.device_prep_slave_sg = tegra_dma_prep_slave_sg;
 	tdma->dma_dev.device_prep_dma_cyclic = tegra_dma_prep_dma_cyclic;
-	tdma->dma_dev.device_control = tegra_dma_device_control;
+	tdma->dma_dev.device_config = tegra_dma_slave_config;
+	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
 	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
 	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
 
-- 
2.1.1
