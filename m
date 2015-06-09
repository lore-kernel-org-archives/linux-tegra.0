From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] pinctrl: make pinctrl_register() return proper error code
Date: Tue,  9 Jun 2015 13:01:16 +0900
Message-ID: <1433822476-26531-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Uy <jasonuy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra@v
List-Id: linux-tegra@vger.kernel.org

Currently, pinctrl_register() just returns NULL on error, so the
callers can not know the exact reason of the failure.

Some of the pinctrl drivers return -EINVAL, some -ENODEV, and some
-ENOMEM on error of pinctrl_register(), although the error code
might be different from the real cause of the error.

This commit reworks pinctrl_register() to return the appropriate
error code and modifies all of the pinctrl drivers to use IS_ERR()
for the error checking and PTR_ERR() for getting the error code.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

This patch is based on linux-pinctrl/devel
(Commit 7164873e7c69d6bab74726debc3b495a86332b1f).

I think I converted all of the pinctrl drivers, but just in case,
I'd like the driver maintainers to check this patch out.


 drivers/pinctrl/bcm/pinctrl-bcm281xx.c        |  4 ++--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c         |  4 ++--
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c     |  4 ++--
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c      |  4 ++--
 drivers/pinctrl/berlin/berlin.c               |  4 ++--
 drivers/pinctrl/core.c                        | 17 ++++++++++-------
 drivers/pinctrl/freescale/pinctrl-imx.c       |  4 ++--
 drivers/pinctrl/freescale/pinctrl-imx1-core.c |  4 ++--
 drivers/pinctrl/freescale/pinctrl-mxs.c       |  4 ++--
 drivers/pinctrl/intel/pinctrl-cherryview.c    |  4 ++--
 drivers/pinctrl/intel/pinctrl-intel.c         |  4 ++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  4 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         |  4 ++--
 drivers/pinctrl/mvebu/pinctrl-mvebu.c         |  4 ++--
 drivers/pinctrl/nomadik/pinctrl-abx500.c      |  4 ++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c     |  4 ++--
 drivers/pinctrl/pinctrl-adi2.c                |  4 ++--
 drivers/pinctrl/pinctrl-amd.c                 |  4 ++--
 drivers/pinctrl/pinctrl-as3722.c              |  4 ++--
 drivers/pinctrl/pinctrl-at91.c                |  4 ++--
 drivers/pinctrl/pinctrl-lantiq.c              |  4 ++--
 drivers/pinctrl/pinctrl-lpc18xx.c             |  4 ++--
 drivers/pinctrl/pinctrl-palmas.c              |  4 ++--
 drivers/pinctrl/pinctrl-pistachio.c           |  4 ++--
 drivers/pinctrl/pinctrl-rockchip.c            |  4 ++--
 drivers/pinctrl/pinctrl-single.c              |  4 ++--
 drivers/pinctrl/pinctrl-st.c                  |  4 ++--
 drivers/pinctrl/pinctrl-tb10x.c               |  4 ++--
 drivers/pinctrl/pinctrl-tegra-xusb.c          |  4 ++--
 drivers/pinctrl/pinctrl-tegra.c               |  4 ++--
 drivers/pinctrl/pinctrl-tz1090-pdc.c          |  4 ++--
 drivers/pinctrl/pinctrl-tz1090.c              |  4 ++--
 drivers/pinctrl/pinctrl-u300.c                |  4 ++--
 drivers/pinctrl/pinctrl-zynq.c                |  4 ++--
 drivers/pinctrl/qcom/pinctrl-msm.c            |  4 ++--
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |  4 ++--
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       |  4 ++--
 drivers/pinctrl/samsung/pinctrl-exynos5440.c  |  4 ++--
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  4 ++--
 drivers/pinctrl/sh-pfc/pinctrl.c              |  4 ++--
 drivers/pinctrl/sirf/pinctrl-atlas7.c         |  4 ++--
 drivers/pinctrl/sirf/pinctrl-sirf.c           |  4 ++--
 drivers/pinctrl/spear/pinctrl-spear.c         |  4 ++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  4 ++--
 drivers/pinctrl/vt8500/pinctrl-wmt.c          |  4 ++--
 45 files changed, 98 insertions(+), 95 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 9641f1c..c3c692e 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1425,9 +1425,9 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 	pctl = pinctrl_register(&bcm281xx_pinctrl_desc,
 				&pdev->dev,
 				pdata);
-	if (!pctl) {
+	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-		return -ENODEV;
+		return PTR_ERR(pctl);
 	}
 
 	platform_set_drvdata(pdev, pdata);
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 8d908e3..efcf2a2 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1036,9 +1036,9 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	pc->pctl_dev = pinctrl_register(&bcm2835_pinctrl_desc, dev, pc);
-	if (!pc->pctl_dev) {
+	if (IS_ERR(pc->pctl_dev)) {
 		gpiochip_remove(&pc->gpio_chip);
-		return -EINVAL;
+		return PTR_ERR(pc->pctl_dev);
 	}
 
 	pc->gpio_range = bcm2835_pinctrl_gpio_range;
diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
index bde45ba..6af538f 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
@@ -748,9 +748,9 @@ static int cygnus_gpio_register_pinconf(struct cygnus_gpio *chip)
 	pctldesc->confops = &cygnus_pconf_ops;
 
 	chip->pctl = pinctrl_register(pctldesc, chip->dev, chip);
-	if (!chip->pctl) {
+	if (IS_ERR(chip->pctl)) {
 		dev_err(chip->dev, "unable to register pinctrl device\n");
-		return -EINVAL;
+		return PTR_ERR(chip->pctl);
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index f9a9283..9728f3d 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -989,9 +989,9 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 
 	pinctrl->pctl = pinctrl_register(&cygnus_pinctrl_desc, &pdev->dev,
 			pinctrl);
-	if (!pinctrl->pctl) {
+	if (IS_ERR(pinctrl->pctl)) {
 		dev_err(&pdev->dev, "unable to register Cygnus IOMUX pinctrl\n");
-		return -EINVAL;
+		return PTR_ERR(pinctrl->pctl);
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 7f0b0f9..ddbcd1d 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -320,9 +320,9 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
 	}
 
 	pctrl->pctrl_dev = pinctrl_register(&berlin_pctrl_desc, dev, pctrl);
-	if (!pctrl->pctrl_dev) {
+	if (IS_ERR(pctrl->pctrl_dev)) {
 		dev_err(dev, "failed to register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(pctrl->pctrl_dev);
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b01ee72..804d126 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1706,14 +1706,14 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 	int ret;
 
 	if (!pctldesc)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	if (!pctldesc->name)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	pctldev = kzalloc(sizeof(*pctldev), GFP_KERNEL);
 	if (pctldev == NULL) {
 		dev_err(dev, "failed to alloc struct pinctrl_dev\n");
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	/* Initialize pin control device struct */
@@ -1726,20 +1726,23 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 	mutex_init(&pctldev->mutex);
 
 	/* check core ops for sanity */
-	if (pinctrl_check_ops(pctldev)) {
+	ret = pinctrl_check_ops(pctldev);
+	if (ret) {
 		dev_err(dev, "pinctrl ops lacks necessary functions\n");
 		goto out_err;
 	}
 
 	/* If we're implementing pinmuxing, check the ops for sanity */
 	if (pctldesc->pmxops) {
-		if (pinmux_check_ops(pctldev))
+		ret = pinmux_check_ops(pctldev);
+		if (ret)
 			goto out_err;
 	}
 
 	/* If we're implementing pinconfig, check the ops for sanity */
 	if (pctldesc->confops) {
-		if (pinconf_check_ops(pctldev))
+		ret = pinconf_check_ops(pctldev);
+		if (ret)
 			goto out_err;
 	}
 
@@ -1785,7 +1788,7 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 out_err:
 	mutex_destroy(&pctldev->mutex);
 	kfree(pctldev);
-	return NULL;
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(pinctrl_register);
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index e73e1ed..d7b98ba 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -727,9 +727,9 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 	ipctl->dev = info->dev;
 	platform_set_drvdata(pdev, ipctl);
 	ipctl->pctl = pinctrl_register(&imx_pinctrl_desc, &pdev->dev, ipctl);
-	if (!ipctl->pctl) {
+	if (IS_ERR(ipctl->pctl)) {
 		dev_err(&pdev->dev, "could not register IMX pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(ipctl->pctl);
 	}
 
 	dev_info(&pdev->dev, "initialized IMX pinctrl driver\n");
diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 5ac59fb..5fd4437 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -633,9 +633,9 @@ int imx1_pinctrl_core_probe(struct platform_device *pdev,
 	ipctl->dev = info->dev;
 	platform_set_drvdata(pdev, ipctl);
 	ipctl->pctl = pinctrl_register(pctl_desc, &pdev->dev, ipctl);
-	if (!ipctl->pctl) {
+	if (IS_ERR(ipctl->pctl)) {
 		dev_err(&pdev->dev, "could not register IMX pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(ipctl->pctl);
 	}
 
 	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 646d5c2..f64eecb 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -540,9 +540,9 @@ int mxs_pinctrl_probe(struct platform_device *pdev,
 	}
 
 	d->pctl = pinctrl_register(&mxs_pinctrl_desc, &pdev->dev, d);
-	if (!d->pctl) {
+	if (IS_ERR(d->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register MXS pinctrl driver\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(d->pctl);
 		goto err;
 	}
 
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 82f691e..9bed70b 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1489,9 +1489,9 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	pctrl->pctldesc.npins = pctrl->community->npins;
 
 	pctrl->pctldev = pinctrl_register(&pctrl->pctldesc, &pdev->dev, pctrl);
-	if (!pctrl->pctldev) {
+	if (IS_ERR(pctrl->pctldev)) {
 		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(pctrl->pctldev);
 	}
 
 	ret = chv_gpio_probe(pctrl, irq);
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 00768e5..f9ee0d6 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1021,9 +1021,9 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 	pctrl->pctldesc.npins = pctrl->soc->npins;
 
 	pctrl->pctldev = pinctrl_register(&pctrl->pctldesc, &pdev->dev, pctrl);
-	if (!pctrl->pctldev) {
+	if (IS_ERR(pctrl->pctldev)) {
 		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(pctrl->pctldev);
 	}
 
 	ret = intel_gpio_probe(pctrl, irq);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index f206a54..35f7b01 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1269,9 +1269,9 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	mtk_pctrl_desc.npins = pctl->devdata->npins;
 	pctl->dev = &pdev->dev;
 	pctl->pctl_dev = pinctrl_register(&mtk_pctrl_desc, &pdev->dev, pctl);
-	if (!pctl->pctl_dev) {
+	if (IS_ERR(pctl->pctl_dev)) {
 		dev_err(&pdev->dev, "couldn't register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(pctl->pctl_dev);
 	}
 
 	pctl->chip = devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_KERNEL);
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index edcd140..7b203bf 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -738,9 +738,9 @@ static int meson_pinctrl_probe(struct platform_device *pdev)
 	pc->desc.npins		= pc->data->num_pins;
 
 	pc->pcdev = pinctrl_register(&pc->desc, pc->dev, pc);
-	if (!pc->pcdev) {
+	if (IS_ERR(pc->pcdev)) {
 		dev_err(pc->dev, "can't register pinctrl device");
-		return -EINVAL;
+		return PTR_ERR(pc->pcdev);
 	}
 
 	ret = meson_gpiolib_register(pc);
diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index f3b426c..77d2221 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -706,9 +706,9 @@ int mvebu_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	pctl->pctldev = pinctrl_register(&pctl->desc, &pdev->dev, pctl);
-	if (!pctl->pctldev) {
+	if (IS_ERR(pctl->pctldev)) {
 		dev_err(&pdev->dev, "unable to register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(pctl->pctldev);
 	}
 
 	dev_info(&pdev->dev, "registered pinctrl driver\n");
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 15ccafd..557d0f2 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -1235,10 +1235,10 @@ static int abx500_gpio_probe(struct platform_device *pdev)
 	abx500_pinctrl_desc.pins = pct->soc->pins;
 	abx500_pinctrl_desc.npins = pct->soc->npins;
 	pct->pctldev = pinctrl_register(&abx500_pinctrl_desc, &pdev->dev, pct);
-	if (!pct->pctldev) {
+	if (IS_ERR(pct->pctldev)) {
 		dev_err(&pdev->dev,
 			"could not register abx500 pinctrl driver\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(pct->pctldev);
 		goto out_rem_chip;
 	}
 	dev_info(&pdev->dev, "registered pin controller\n");
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 2589304..809d884 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -2029,9 +2029,9 @@ static int nmk_pinctrl_probe(struct platform_device *pdev)
 	npct->dev = &pdev->dev;
 
 	npct->pctl = pinctrl_register(&nmk_pinctrl_desc, &pdev->dev, npct);
-	if (!npct->pctl) {
+	if (IS_ERR(npct->pctl)) {
 		dev_err(&pdev->dev, "could not register Nomadik pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(npct->pctl);
 	}
 
 	/* We will handle a range of GPIO pins */
diff --git a/drivers/pinctrl/pinctrl-adi2.c b/drivers/pinctrl/pinctrl-adi2.c
index 49df903..873433d 100644
--- a/drivers/pinctrl/pinctrl-adi2.c
+++ b/drivers/pinctrl/pinctrl-adi2.c
@@ -1070,9 +1070,9 @@ static int adi_pinctrl_probe(struct platform_device *pdev)
 
 	/* Now register the pin controller and all pins it handles */
 	pinctrl->pctl = pinctrl_register(&adi_pinmux_desc, &pdev->dev, pinctrl);
-	if (!pinctrl->pctl) {
+	if (IS_ERR(pinctrl->pctl)) {
 		dev_err(&pdev->dev, "could not register pinctrl ADI2 driver\n");
-		return -EINVAL;
+		return PTR_ERR(pinctrl->pctl);
 	}
 
 	platform_set_drvdata(pdev, pinctrl);
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index e747912..d8e3f7c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -789,9 +789,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	amd_pinctrl_desc.name = dev_name(&pdev->dev);
 	gpio_dev->pctrl = pinctrl_register(&amd_pinctrl_desc,
 					&pdev->dev, gpio_dev);
-	if (!gpio_dev->pctrl) {
+	if (IS_ERR(gpio_dev->pctrl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(gpio_dev->pctrl);
 	}
 
 	ret = gpiochip_add(&gpio_dev->gc);
diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index db0571f..4747e08 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -586,9 +586,9 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as3722_pinctrl_desc.npins = ARRAY_SIZE(as3722_pins_desc);
 	as_pci->pctl = pinctrl_register(&as3722_pinctrl_desc,
 					&pdev->dev, as_pci);
-	if (!as_pci->pctl) {
+	if (IS_ERR(as_pci->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(as_pci->pctl);
 	}
 
 	as_pci->gpio_chip = as3722_gpio_chip;
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index d80ade2..a082447 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1238,9 +1238,9 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 	info->pctl = pinctrl_register(&at91_pinctrl_desc, &pdev->dev, info);
 
-	if (!info->pctl) {
+	if (IS_ERR(info->pctl)) {
 		dev_err(&pdev->dev, "could not register AT91 pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(info->pctl);
 	}
 
 	/* We will handle a range of GPIO pins */
diff --git a/drivers/pinctrl/pinctrl-lantiq.c b/drivers/pinctrl/pinctrl-lantiq.c
index 296e5b3..fc38a85 100644
--- a/drivers/pinctrl/pinctrl-lantiq.c
+++ b/drivers/pinctrl/pinctrl-lantiq.c
@@ -337,9 +337,9 @@ int ltq_pinctrl_register(struct platform_device *pdev,
 	info->dev = &pdev->dev;
 
 	info->pctrl = pinctrl_register(desc, &pdev->dev, info);
-	if (!info->pctrl) {
+	if (IS_ERR(info->pctrl)) {
 		dev_err(&pdev->dev, "failed to register LTQ pinmux driver\n");
-		return -EINVAL;
+		return PTR_ERR(info->pctrl);
 	}
 	platform_set_drvdata(pdev, info);
 	return 0;
diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index a8bc1ad..ef0b697 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -1180,10 +1180,10 @@ static int lpc18xx_scu_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, scu);
 
 	scu->pctl = pinctrl_register(&lpc18xx_scu_desc, &pdev->dev, scu);
-	if (!scu->pctl) {
+	if (IS_ERR(scu->pctl)) {
 		dev_err(&pdev->dev, "Could not register pinctrl driver\n");
 		clk_disable_unprepare(scu->clk);
-		return -EINVAL;
+		return PTR_ERR(scu->pctl);
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 2631df0..f7e1680 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -1044,9 +1044,9 @@ static int palmas_pinctrl_probe(struct platform_device *pdev)
 	palmas_pinctrl_desc.pins = palmas_pins_desc;
 	palmas_pinctrl_desc.npins = ARRAY_SIZE(palmas_pins_desc);
 	pci->pctl = pinctrl_register(&palmas_pinctrl_desc, &pdev->dev, pci);
-	if (!pci->pctl) {
+	if (IS_ERR(pci->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(pci->pctl);
 	}
 	return 0;
 }
diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 079ce8b..63100be 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1474,9 +1474,9 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 
 	pctl->pctldev = pinctrl_register(&pistachio_pinctrl_desc, &pdev->dev,
 					 pctl);
-	if (!pctl->pctldev) {
+	if (IS_ERR(pctl->pctldev)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl device\n");
-		return -EINVAL;
+		return PTR_ERR(pctl->pctldev);
 	}
 
 	ret = pistachio_gpio_register(pctl);
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index dee7d5f..6e7643f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1274,9 +1274,9 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 		return ret;
 
 	info->pctl_dev = pinctrl_register(ctrldesc, &pdev->dev, info);
-	if (!info->pctl_dev) {
+	if (IS_ERR(info->pctl_dev)) {
 		dev_err(&pdev->dev, "could not register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(info->pctl_dev);
 	}
 
 	for (bank = 0; bank < info->ctrl->nr_banks; ++bank) {
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 968e352..b2de09d 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1921,9 +1921,9 @@ static int pcs_probe(struct platform_device *pdev)
 		goto free;
 
 	pcs->pctl = pinctrl_register(&pcs->desc, pcs->dev, pcs);
-	if (!pcs->pctl) {
+	if (IS_ERR(pcs->pctl)) {
 		dev_err(pcs->dev, "could not register single pinctrl driver\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(pcs->pctl);
 		goto free;
 	}
 
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 65bf73b..d34ac87 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1737,9 +1737,9 @@ static int st_pctl_probe(struct platform_device *pdev)
 	pctl_desc->name		= dev_name(&pdev->dev);
 
 	info->pctl = pinctrl_register(pctl_desc, &pdev->dev, info);
-	if (!info->pctl) {
+	if (IS_ERR(info->pctl)) {
 		dev_err(&pdev->dev, "Failed pinctrl registration\n");
-		return -EINVAL;
+		return PTR_ERR(info->pctl);
 	}
 
 	for (i = 0; i < info->nbanks; i++)
diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 160a1f5..6546b9b 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -807,9 +807,9 @@ static int tb10x_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	state->pctl = pinctrl_register(&tb10x_pindesc, dev, state);
-	if (!state->pctl) {
+	if (IS_ERR(state->pctl)) {
 		dev_err(dev, "could not register TB10x pin driver\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(state->pctl);
 		goto fail;
 	}
 
diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index 6a6eebf..2651d04 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -922,9 +922,9 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	padctl->desc.owner = THIS_MODULE;
 
 	padctl->pinctrl = pinctrl_register(&padctl->desc, &pdev->dev, padctl);
-	if (!padctl->pinctrl) {
+	if (IS_ERR(padctl->pinctrl)) {
 		dev_err(&pdev->dev, "failed to register pincontrol\n");
-		err = -ENODEV;
+		err = PTR_ERR(padctl->pinctrl);
 		goto reset;
 	}
 
diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 4c95c20..0f982b8 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -703,9 +703,9 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	}
 
 	pmx->pctl = pinctrl_register(&tegra_pinctrl_desc, &pdev->dev, pmx);
-	if (!pmx->pctl) {
+	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(pmx->pctl);
 	}
 
 	pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
diff --git a/drivers/pinctrl/pinctrl-tz1090-pdc.c b/drivers/pinctrl/pinctrl-tz1090-pdc.c
index 8a8911b..c349911 100644
--- a/drivers/pinctrl/pinctrl-tz1090-pdc.c
+++ b/drivers/pinctrl/pinctrl-tz1090-pdc.c
@@ -948,9 +948,9 @@ static int tz1090_pdc_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pmx->regs);
 
 	pmx->pctl = pinctrl_register(&tz1090_pdc_pinctrl_desc, &pdev->dev, pmx);
-	if (!pmx->pctl) {
+	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(pmx->pctl);
 	}
 
 	platform_set_drvdata(pdev, pmx);
diff --git a/drivers/pinctrl/pinctrl-tz1090.c b/drivers/pinctrl/pinctrl-tz1090.c
index fc5594a5..6d07a2f 100644
--- a/drivers/pinctrl/pinctrl-tz1090.c
+++ b/drivers/pinctrl/pinctrl-tz1090.c
@@ -1963,9 +1963,9 @@ static int tz1090_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pmx->regs);
 
 	pmx->pctl = pinctrl_register(&tz1090_pinctrl_desc, &pdev->dev, pmx);
-	if (!pmx->pctl) {
+	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(pmx->pctl);
 	}
 
 	platform_set_drvdata(pdev, pmx);
diff --git a/drivers/pinctrl/pinctrl-u300.c b/drivers/pinctrl/pinctrl-u300.c
index f931e65..c076021 100644
--- a/drivers/pinctrl/pinctrl-u300.c
+++ b/drivers/pinctrl/pinctrl-u300.c
@@ -1068,9 +1068,9 @@ static int u300_pmx_probe(struct platform_device *pdev)
 		return PTR_ERR(upmx->virtbase);
 
 	upmx->pctl = pinctrl_register(&u300_pmx_desc, &pdev->dev, upmx);
-	if (!upmx->pctl) {
+	if (IS_ERR(upmx->pctl)) {
 		dev_err(&pdev->dev, "could not register U300 pinmux driver\n");
-		return -EINVAL;
+		return PTR_ERR(upmx->pctl);
 	}
 
 	platform_set_drvdata(pdev, upmx);
diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 40b2aff..7ce23b6 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1196,8 +1196,8 @@ static int zynq_pinctrl_probe(struct platform_device *pdev)
 	pctrl->nfuncs = ARRAY_SIZE(zynq_pmux_functions);
 
 	pctrl->pctrl = pinctrl_register(&zynq_desc, &pdev->dev, pctrl);
-	if (!pctrl->pctrl)
-		return -ENOMEM;
+	if (IS_ERR(pctrl->pctrl))
+		return PTR_ERR(pctrl->pctrl);
 
 	platform_set_drvdata(pdev, pctrl);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f3d800f..e457d52 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -906,9 +906,9 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	msm_pinctrl_desc.pins = pctrl->soc->pins;
 	msm_pinctrl_desc.npins = pctrl->soc->npins;
 	pctrl->pctrl = pinctrl_register(&msm_pinctrl_desc, &pdev->dev, pctrl);
-	if (!pctrl->pctrl) {
+	if (IS_ERR(pctrl->pctrl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(pctrl->pctrl);
 	}
 
 	ret = msm_gpio_init(pctrl);
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index b2d2221..f92f229 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -776,8 +776,8 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	state->chip.can_sleep = false;
 
 	state->ctrl = pinctrl_register(pctrldesc, dev, state);
-	if (!state->ctrl)
-		return -ENODEV;
+	if (IS_ERR(state->ctrl))
+		return PTR_ERR(state->ctrl);
 
 	ret = gpiochip_add(&state->chip);
 	if (ret) {
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 8f36c5f..cd7ca11 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -890,8 +890,8 @@ static int pmic_mpp_probe(struct platform_device *pdev)
 	state->chip.can_sleep = false;
 
 	state->ctrl = pinctrl_register(pctrldesc, dev, state);
-	if (!state->ctrl)
-		return -ENODEV;
+	if (IS_ERR(state->ctrl))
+		return PTR_ERR(state->ctrl);
 
 	ret = gpiochip_add(&state->chip);
 	if (ret) {
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos5440.c b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
index 86192be..f5619fb 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos5440.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
@@ -822,9 +822,9 @@ static int exynos5440_pinctrl_register(struct platform_device *pdev,
 		return ret;
 
 	pctl_dev = pinctrl_register(ctrldesc, &pdev->dev, priv);
-	if (!pctl_dev) {
+	if (IS_ERR(pctl_dev)) {
 		dev_err(&pdev->dev, "could not register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(pctl_dev);
 	}
 
 	grange.name = "exynos5440-pctrl-gpio-range";
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 0fd20c5..3dd5a3b 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -873,9 +873,9 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
 		return ret;
 
 	drvdata->pctl_dev = pinctrl_register(ctrldesc, &pdev->dev, drvdata);
-	if (!drvdata->pctl_dev) {
+	if (IS_ERR(drvdata->pctl_dev)) {
 		dev_err(&pdev->dev, "could not register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(drvdata->pctl_dev);
 	}
 
 	for (bank = 0; bank < drvdata->nr_banks; ++bank) {
diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 072e7c6..ff67896 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -625,8 +625,8 @@ int sh_pfc_register_pinctrl(struct sh_pfc *pfc)
 	pmx->pctl_desc.npins = pfc->info->nr_pins;
 
 	pmx->pctl = pinctrl_register(&pmx->pctl_desc, pfc->dev, pmx);
-	if (pmx->pctl == NULL)
-		return -EINVAL;
+	if (IS_ERR(pmx->pctl))
+		return PTR_ERR(pmx->pctl);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index c2ced3f..9384e0a 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -4079,9 +4079,9 @@ static int atlas7_pinmux_probe(struct platform_device *pdev)
 
 	/* Now register the pin controller and all pins it handles */
 	pmx->pctl = pinctrl_register(&pmx->pctl_desc, &pdev->dev, pmx);
-	if (!pmx->pctl) {
+	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "could not register atlas7 pinmux driver\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(pmx->pctl);
 		goto unmap_io;
 	}
 
diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index e2efbba..8ba26e4 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -310,9 +310,9 @@ static int sirfsoc_pinmux_probe(struct platform_device *pdev)
 
 	/* Now register the pin controller and all pins it handles */
 	spmx->pmx = pinctrl_register(&sirfsoc_pinmux_desc, &pdev->dev, spmx);
-	if (!spmx->pmx) {
+	if (IS_ERR(spmx->pmx)) {
 		dev_err(&pdev->dev, "could not register SIRFSOC pinmux driver\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(spmx->pmx);
 		goto out_no_pmx;
 	}
 
diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index abdb05a..f87a5ea 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -396,9 +396,9 @@ int spear_pinctrl_probe(struct platform_device *pdev,
 	spear_pinctrl_desc.npins = machdata->npins;
 
 	pmx->pctl = pinctrl_register(&spear_pinctrl_desc, &pdev->dev, pmx);
-	if (!pmx->pctl) {
+	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return -ENODEV;
+		return PTR_ERR(pmx->pctl);
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index f8e171b..d7857c7 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -911,9 +911,9 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
 
 	pctl->pctl_dev = pinctrl_register(pctrl_desc,
 					  &pdev->dev, pctl);
-	if (!pctl->pctl_dev) {
+	if (IS_ERR(pctl->pctl_dev)) {
 		dev_err(&pdev->dev, "couldn't register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(pctl->pctl_dev);
 	}
 
 	pctl->chip = devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_KERNEL);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index d055d63..c15316b 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -594,9 +594,9 @@ int wmt_pinctrl_probe(struct platform_device *pdev,
 	data->dev = &pdev->dev;
 
 	data->pctl_dev = pinctrl_register(&wmt_desc, &pdev->dev, data);
-	if (!data->pctl_dev) {
+	if (IS_ERR(data->pctl_dev)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-		return -EINVAL;
+		return PTR_ERR(data->pctl_dev);
 	}
 
 	err = gpiochip_add(&data->gpio_chip);
-- 
1.9.1
