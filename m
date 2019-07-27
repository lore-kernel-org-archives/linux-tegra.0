From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 12/34] ASoC: spear: use devm_platform_ioremap_resource() to simplify code
Date: Sat, 27 Jul 2019 23:07:16 +0800
Message-ID: <20190727150738.54764-13-yuehaibing@huawei.com>
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
 sound/soc/spear/spdif_in.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/spear/spdif_in.c b/sound/soc/spear/spdif_in.c
index 78a6a36..4b68d6e 100644
--- a/sound/soc/spear/spdif_in.c
+++ b/sound/soc/spear/spdif_in.c
@@ -202,12 +202,11 @@ static int spdif_in_probe(struct platform_device *pdev)
 {
 	struct spdif_in_dev *host;
 	struct spear_spdif_platform_data *pdata;
-	struct resource *res, *res_fifo;
+	struct resource *res_fifo;
 	void __iomem *io_base;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	io_base = devm_ioremap_resource(&pdev->dev, res);
+	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
-- 
2.7.4
