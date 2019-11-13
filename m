From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 1/3] tty: serial: amba-pl011: Use dma_request_chan() directly for channel request
Date: Wed, 13 Nov 2019 11:46:16 +0200
Message-ID: <20191113094618.1725-2-peter.ujfalusi@ti.com>
References: <20191113094618.1725-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191113094618.1725-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, linux@armlinux.org.uk, agross@kernel.org, bjorn.andersson@linaro.org, ldewangan@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: vkoul@kernel.org, jslaby@suse.com, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

dma_request_slave_channel_reason() is:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/tty/serial/amba-pl011.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index ae63266e181f..38e2d25f7e23 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -414,7 +414,7 @@ static void pl011_dma_probe(struct uart_amba_port *uap)
 	dma_cap_mask_t mask;
 
 	uap->dma_probed = true;
-	chan = dma_request_slave_channel_reason(dev, "tx");
+	chan = dma_request_chan(dev, "tx");
 	if (IS_ERR(chan)) {
 		if (PTR_ERR(chan) == -EPROBE_DEFER) {
 			uap->dma_probed = false;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
