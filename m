From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 23/34] ASoC: psc-ac97: use devm_platform_ioremap_resource() to simplify code
Date: Sat, 27 Jul 2019 23:07:27 +0800
Message-ID: <20190727150738.54764-24-yuehaibing@huawei.com>
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
 sound/soc/au1x/psc-ac97.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 21e5f6a..08bc04e 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -363,7 +363,7 @@ static const struct snd_soc_component_driver au1xpsc_ac97_component = {
 static int au1xpsc_ac97_drvprobe(struct platform_device *pdev)
 {
 	int ret;
-	struct resource *iores, *dmares;
+	struct resource *dmares;
 	unsigned long sel;
 	struct au1xpsc_audio_data *wd;
 
@@ -374,8 +374,7 @@ static int au1xpsc_ac97_drvprobe(struct platform_device *pdev)
 
 	mutex_init(&wd->lock);
 
-	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	wd->mmio = devm_ioremap_resource(&pdev->dev, iores);
+	wd->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(wd->mmio))
 		return PTR_ERR(wd->mmio);
 
-- 
2.7.4
