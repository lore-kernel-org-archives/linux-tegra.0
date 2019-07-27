From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 06/34] ASoC: mt6797: use devm_platform_ioremap_resource() to simplify code
Date: Sat, 27 Jul 2019 23:07:10 +0800
Message-ID: <20190727150738.54764-7-yuehaibing@huawei.com>
References: <20190727150738.54764-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727150738.54764-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, paul@crapouillou.net, timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com, matthias.bgg@gmail.com, jbrunet@baylibre.com, khilman@baylibre.com, daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, baohua@kernel.org, olivier.moysan@st.com, arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, mripard@kernel.org, wens@csie.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-xtensa@linux-xtensa.org, gregkh@linuxfoundation.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 08a6532..dea0e07 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -749,7 +749,6 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt6797_afe_private *afe_priv;
-	struct resource *res;
 	struct device *dev;
 	int i, irq_id, ret;
 
@@ -774,9 +773,7 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 	}
 
 	/* regmap init */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
 
-- 
2.7.4
