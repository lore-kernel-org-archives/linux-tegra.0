From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: tegra: use devm_platform_ioremap_resource() to simplify code" to the asoc tree
Date: Wed,  4 Sep 2019 18:53:25 +0100 (BST)
Message-ID: <20190904175325.74E7F2742CDC@ypsilon.sirena.org.uk>
References: <20190904083909.18804-1-yuehaibing@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904083909.18804-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: alexios.zavras@intel.com, alsa-devel@alsa-project.org, broonie@kernel.org, gregkh@linuxfoundation.org, Hulk Robot <hulkci@huawei.com>, jonathanh@nvidia.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.orgMark Brown <broonie@kernel.org>, perex@perex.cz, rfontana@redhat.com, tglx@linutronix.de, thierry.reding@gmail.com, tiwai@suse.com, yuehaibing@huawei.com
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: use devm_platform_ioremap_resource() to simplify code

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

From a813d0e8884e514e6e1b28ad3b22f7658d446b16 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 4 Sep 2019 16:39:09 +0800
Subject: [PATCH] ASoC: tegra: use devm_platform_ioremap_resource() to simplify
 code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190904083909.18804-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra30_ahub.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 952381260dc3..635eacbd28d4 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -511,7 +511,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	const struct tegra30_ahub_soc_data *soc_data;
 	struct reset_control *rst;
 	int i;
-	struct resource *res0, *res1;
+	struct resource *res0;
 	void __iomem *regs_apbif, *regs_ahub;
 	int ret = 0;
 
@@ -587,8 +587,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	}
 	regcache_cache_only(ahub->regmap_apbif, true);
 
-	res1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	regs_ahub = devm_ioremap_resource(&pdev->dev, res1);
+	regs_ahub = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(regs_ahub))
 		return PTR_ERR(regs_ahub);
 
-- 
2.20.1
