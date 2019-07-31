From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: fsl_audmix: use devm_platform_ioremap_resource() to simplify code" to the asoc tree
Date: Wed, 31 Jul 2019 12:29:48 +0100 (BST)
Message-ID: <20190731112948.8D5682742CC3@ypsilon.sirena.org.uk>
References: <20190727150738.54764-9-yuehaibing@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727150738.54764-9-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: alexandre.torgue@st.com, alsa-devel@alsa-project.org, arnaud.pouliquen@st.com, baohua@kernel.org, bcm-kernel-feedback-list@broadcom.com, broonie@kernel.org, daniel@zonque.org, eric@anholt.net, festevam@gmail.com, f.fainelli@gmail.com, gregkh@linuxfoundation.org, haojian.zhuang@gmail.com, Hulk Robot <hulkci@huawei.com>, jbrunet@baylibre.com, jcmvbkbc@gmail.com, jonathanh@nvidia.com, kernel@pengutronix.de, khilman@baylibre.com, lgirdwood@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-xtensa@linux-xtensa.org
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: fsl_audmix: use devm_platform_ioremap_resource() to simplify code

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

From 959bb6b54d708652fe06097feecc3acd4d6b8c89 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:12 +0800
Subject: [PATCH] ASoC: fsl_audmix: use devm_platform_ioremap_resource() to
 simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-9-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_audmix.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 3897a54a11fe..c7e4e9757dce 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -458,7 +458,6 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fsl_audmix *priv;
-	struct resource *res;
 	const char *mdrv;
 	const struct of_device_id *of_id;
 	void __iomem *regs;
@@ -475,8 +474,7 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Get the addresses */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-- 
2.20.1
