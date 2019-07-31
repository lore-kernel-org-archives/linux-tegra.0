From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: codecs: msm8916-wcd: use devm_platform_ioremap_resource() to simplify code" to the asoc tree
Date: Wed, 31 Jul 2019 12:29:42 +0100 (BST)
Message-ID: <20190731112942.3841B2742CDE@ypsilon.sirena.org.uk>
References: <20190727150738.54764-17-yuehaibing@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727150738.54764-17-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: alexandre.torgue@st.com, alsa-devel@alsa-project.org, arnaud.pouliquen@st.com, baohua@kernel.org, bcm-kernel-feedback-list@broadcom.com, broonie@kernel.org, daniel@zonque.org, eric@anholt.net, festevam@gmail.com, f.fainelli@gmail.com, gregkh@linuxfoundation.org, haojian.zhuang@gmail.com, Hulk Robot <hulkci@huawei.com>, jbrunet@baylibre.com, jcmvbkbc@gmail.com, jonathanh@nvidia.com, kernel@pengutronix.de, khilman@baylibre.com, lgirdwood@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-xtensa@linux-xtensa.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: codecs: msm8916-wcd: use devm_platform_ioremap_resource() to simplify code

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f62d6426718837663484bbf0ed94e56573cbc365 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:20 +0800
Subject: [PATCH] ASoC: codecs: msm8916-wcd: use
 devm_platform_ioremap_resource() to simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-17-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index 1db7e43ec203..9fa5d44fdc79 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -1143,7 +1143,6 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
 	struct msm8916_wcd_digital_priv *priv;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
-	struct resource *mem_res;
 	struct regmap *digital_map;
 	int ret;
 
@@ -1151,8 +1150,7 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, mem_res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.20.1
