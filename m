From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 01/34] rtc: asm9260: use devm_platform_ioremap_resource() to simplify code
Date: Sun, 6 Oct 2019 18:29:20 +0800
Message-ID: <20191006102953.57536-2-yuehaibing@huawei.com>
References: <20191006102953.57536-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191006102953.57536-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com, joel@jms.id.au, andrew@aj.id.au, nicolas.ferre@microchip.com, ludovic.desroches@microchip.com, computersforpeace@gmail.com, gregory.0xf0@gmail.com, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, baruch@tkos.co.il, paul@crapouillou.net, vz@mleia.com, slemieux.tyco@gmail.com, khilman@baylibre.com, eddie.huang@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, mripard@kernel.org, wens@csie.org, thierry.reding@gmail.com, jonathanh@nvidia.com, linux@prisktech.co.nz, michal.simek@xilinx.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/rtc/rtc-asm9260.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index 10413d8..10064bd 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -245,7 +245,6 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
 {
 	struct asm9260_rtc_priv *priv;
 	struct device *dev = &pdev->dev;
-	struct resource	*res;
 	int irq_alarm, ret;
 	u32 ccr;
 
@@ -260,8 +259,7 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
 	if (irq_alarm < 0)
 		return irq_alarm;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->iobase = devm_ioremap_resource(dev, res);
+	priv->iobase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->iobase))
 		return PTR_ERR(priv->iobase);
 
-- 
2.7.4
