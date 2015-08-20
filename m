From: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4] Watchdog: Fix parent of watchdog_devices
Date: Thu, 20 Aug 2015 14:05:01 +0530
Message-ID: <d035c08984bb06bd81e49fa587fab1da44533bcc.1440059435.git.panand@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Johannes Thumshirn <jthumshirn-l3A5Bk7waGM@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Werner <andreas.werner-csrFAY9JiS4@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Johannes Thumshirn <morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:ARM/STI ARCHITECTURE" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "moderated list:ARM/U300 MACHINE
	SUPPORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:INTEL MANAGE" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

/sys/class/watchdog/watchdogn/device/modalias can help to identify the
driver/module for a given watchdog node. However, many wdt devices do n=
ot
set their parent and so, we do not see an entry for device in sysfs for
such devices.

This patch fixes parent of watchdog_device so that
/sys/class/watchdog/watchdogn/device is populated.

Exceptions: booke, diag288, octeon, softdog and w83627hf -- They do not
have any parent. Not sure, how we can identify driver for these devices=
=2E

Signed-off-by: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Johannes Thumshirn <jthumshirn-l3A5Bk7waGM@public.gmane.org>
Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Acked-by: H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Acked-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
* Changes since v3:
- Fixed max no number of columns in the description to 75=20
- Fixed grammatical mistake in patch description reported by Uwe
Kleine-K=C3=B6nig.
- Fixed for mpc8xxx as well.
* Changes since v2:
- Fixed drivers/watchdog/txx9wdt.c:134:20: error: 'pdev' undeclared
Reported-by: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
* Changes since v1:
- Squash all commits of V1 into a single patch.
- V1 was here:
	http://www.spinics.net/lists/linux-watchdog/msg07220.html

 drivers/misc/mei/wd.c               | 1 +
 drivers/watchdog/bcm2835_wdt.c      | 1 +
 drivers/watchdog/bcm47xx_wdt.c      | 1 +
 drivers/watchdog/bcm_kona_wdt.c     | 1 +
 drivers/watchdog/coh901327_wdt.c    | 1 +
 drivers/watchdog/da9052_wdt.c       | 1 +
 drivers/watchdog/da9055_wdt.c       | 1 +
 drivers/watchdog/da9062_wdt.c       | 1 +
 drivers/watchdog/da9063_wdt.c       | 1 +
 drivers/watchdog/davinci_wdt.c      | 1 +
 drivers/watchdog/digicolor_wdt.c    | 1 +
 drivers/watchdog/ep93xx_wdt.c       | 1 +
 drivers/watchdog/gpio_wdt.c         | 1 +
 drivers/watchdog/ie6xx_wdt.c        | 1 +
 drivers/watchdog/intel-mid_wdt.c    | 1 +
 drivers/watchdog/jz4740_wdt.c       | 1 +
 drivers/watchdog/mena21_wdt.c       | 1 +
 drivers/watchdog/menf21bmc_wdt.c    | 1 +
 drivers/watchdog/mpc8xxx_wdt.c      | 1 +
 drivers/watchdog/omap_wdt.c         | 1 +
 drivers/watchdog/orion_wdt.c        | 1 +
 drivers/watchdog/pnx4008_wdt.c      | 1 +
 drivers/watchdog/qcom-wdt.c         | 1 +
 drivers/watchdog/retu_wdt.c         | 1 +
 drivers/watchdog/rt2880_wdt.c       | 1 +
 drivers/watchdog/s3c2410_wdt.c      | 1 +
 drivers/watchdog/shwdt.c            | 1 +
 drivers/watchdog/sirfsoc_wdt.c      | 1 +
 drivers/watchdog/sp805_wdt.c        | 1 +
 drivers/watchdog/st_lpc_wdt.c       | 1 +
 drivers/watchdog/stmp3xxx_rtc_wdt.c | 1 +
 drivers/watchdog/tegra_wdt.c        | 1 +
 drivers/watchdog/twl4030_wdt.c      | 1 +
 drivers/watchdog/txx9wdt.c          | 1 +
 drivers/watchdog/ux500_wdt.c        | 1 +
 drivers/watchdog/via_wdt.c          | 1 +
 drivers/watchdog/wm831x_wdt.c       | 1 +
 drivers/watchdog/wm8350_wdt.c       | 1 +
 38 files changed, 38 insertions(+)

diff --git a/drivers/misc/mei/wd.c b/drivers/misc/mei/wd.c
index 2bc0f5089f82..b346638833b0 100644
--- a/drivers/misc/mei/wd.c
+++ b/drivers/misc/mei/wd.c
@@ -364,6 +364,7 @@ int mei_watchdog_register(struct mei_device *dev)
=20
 	int ret;
=20
+	amt_wd_dev.parent =3D dev->dev;
 	/* unlock to perserve correct locking order */
 	mutex_unlock(&dev->device_lock);
 	ret =3D watchdog_register_device(&amt_wd_dev);
diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_=
wdt.c
index 7116968dee12..66c3e656a616 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -182,6 +182,7 @@ static int bcm2835_wdt_probe(struct platform_device=
 *pdev)
 	watchdog_set_drvdata(&bcm2835_wdt_wdd, wdt);
 	watchdog_init_timeout(&bcm2835_wdt_wdd, heartbeat, dev);
 	watchdog_set_nowayout(&bcm2835_wdt_wdd, nowayout);
+	bcm2835_wdt_wdd.parent =3D &pdev->dev;
 	err =3D watchdog_register_device(&bcm2835_wdt_wdd);
 	if (err) {
 		dev_err(dev, "Failed to register watchdog device");
diff --git a/drivers/watchdog/bcm47xx_wdt.c b/drivers/watchdog/bcm47xx_=
wdt.c
index b28a072abf78..4064a43f1360 100644
--- a/drivers/watchdog/bcm47xx_wdt.c
+++ b/drivers/watchdog/bcm47xx_wdt.c
@@ -209,6 +209,7 @@ static int bcm47xx_wdt_probe(struct platform_device=
 *pdev)
=20
 	wdt->wdd.info =3D &bcm47xx_wdt_info;
 	wdt->wdd.timeout =3D WDT_DEFAULT_TIME;
+	wdt->wdd.parent =3D &pdev->dev;
 	ret =3D wdt->wdd.ops->set_timeout(&wdt->wdd, timeout);
 	if (ret)
 		goto err_timer;
diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kon=
a_wdt.c
index 22d8ae65772a..e0c98423f2c9 100644
--- a/drivers/watchdog/bcm_kona_wdt.c
+++ b/drivers/watchdog/bcm_kona_wdt.c
@@ -319,6 +319,7 @@ static int bcm_kona_wdt_probe(struct platform_devic=
e *pdev)
 	spin_lock_init(&wdt->lock);
 	platform_set_drvdata(pdev, wdt);
 	watchdog_set_drvdata(&bcm_kona_wdt_wdd, wdt);
+	bcm_kona_wdt_wdd.parent =3D &pdev->dev;
=20
 	ret =3D bcm_kona_wdt_set_timeout_reg(&bcm_kona_wdt_wdd, 0);
 	if (ret) {
diff --git a/drivers/watchdog/coh901327_wdt.c b/drivers/watchdog/coh901=
327_wdt.c
index ce12f437f195..a099b77fc0b9 100644
--- a/drivers/watchdog/coh901327_wdt.c
+++ b/drivers/watchdog/coh901327_wdt.c
@@ -358,6 +358,7 @@ static int __init coh901327_probe(struct platform_d=
evice *pdev)
 	if (ret < 0)
 		coh901327_wdt.timeout =3D 60;
=20
+	coh901327_wdt.parent =3D &pdev->dev;
 	ret =3D watchdog_register_device(&coh901327_wdt);
 	if (ret =3D=3D 0)
 		dev_info(&pdev->dev,
diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wd=
t.c
index 2e9589652e1e..67e67977bd29 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -195,6 +195,7 @@ static int da9052_wdt_probe(struct platform_device =
*pdev)
 	da9052_wdt->timeout =3D DA9052_DEF_TIMEOUT;
 	da9052_wdt->info =3D &da9052_wdt_info;
 	da9052_wdt->ops =3D &da9052_wdt_ops;
+	da9052_wdt->parent =3D &pdev->dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
=20
 	kref_init(&driver_data->kref);
diff --git a/drivers/watchdog/da9055_wdt.c b/drivers/watchdog/da9055_wd=
t.c
index 495089d8dbfe..04d1430d93d2 100644
--- a/drivers/watchdog/da9055_wdt.c
+++ b/drivers/watchdog/da9055_wdt.c
@@ -161,6 +161,7 @@ static int da9055_wdt_probe(struct platform_device =
*pdev)
 	da9055_wdt->timeout =3D DA9055_DEF_TIMEOUT;
 	da9055_wdt->info =3D &da9055_wdt_info;
 	da9055_wdt->ops =3D &da9055_wdt_ops;
+	da9055_wdt->parent =3D &pdev->dev;
 	watchdog_set_nowayout(da9055_wdt, nowayout);
 	watchdog_set_drvdata(da9055_wdt, driver_data);
=20
diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wd=
t.c
index b3a870ce85be..7386111220d5 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -210,6 +210,7 @@ static int da9062_wdt_probe(struct platform_device =
*pdev)
 	wdt->wdtdev.max_timeout =3D DA9062_WDT_MAX_TIMEOUT;
 	wdt->wdtdev.timeout =3D DA9062_WDG_DEFAULT_TIMEOUT;
 	wdt->wdtdev.status =3D WATCHDOG_NOWAYOUT_INIT_STATUS;
+	wdt->wdtdev.parent =3D &pdev->dev;
=20
 	watchdog_set_drvdata(&wdt->wdtdev, wdt);
 	dev_set_drvdata(&pdev->dev, wdt);
diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wd=
t.c
index e2fe2ebdebd4..6bf130bd863d 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -175,6 +175,7 @@ static int da9063_wdt_probe(struct platform_device =
*pdev)
 	wdt->wdtdev.min_timeout =3D DA9063_WDT_MIN_TIMEOUT;
 	wdt->wdtdev.max_timeout =3D DA9063_WDT_MAX_TIMEOUT;
 	wdt->wdtdev.timeout =3D DA9063_WDG_TIMEOUT;
+	wdt->wdtdev.parent =3D &pdev->dev;
=20
 	wdt->wdtdev.status =3D WATCHDOG_NOWAYOUT_INIT_STATUS;
=20
diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_=
wdt.c
index cfdf8a408aea..17454ca653f4 100644
--- a/drivers/watchdog/davinci_wdt.c
+++ b/drivers/watchdog/davinci_wdt.c
@@ -179,6 +179,7 @@ static int davinci_wdt_probe(struct platform_device=
 *pdev)
 	wdd->min_timeout	=3D 1;
 	wdd->max_timeout	=3D MAX_HEARTBEAT;
 	wdd->timeout		=3D DEFAULT_HEARTBEAT;
+	wdd->parent		=3D &pdev->dev;
=20
 	watchdog_init_timeout(wdd, heartbeat, dev);
=20
diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digico=
lor_wdt.c
index 31d8e4936611..50abe1bf62a5 100644
--- a/drivers/watchdog/digicolor_wdt.c
+++ b/drivers/watchdog/digicolor_wdt.c
@@ -143,6 +143,7 @@ static int dc_wdt_probe(struct platform_device *pde=
v)
 	}
 	dc_wdt_wdd.max_timeout =3D U32_MAX / clk_get_rate(wdt->clk);
 	dc_wdt_wdd.timeout =3D dc_wdt_wdd.max_timeout;
+	dc_wdt_wdd.parent =3D &pdev->dev;
=20
 	spin_lock_init(&wdt->lock);
=20
diff --git a/drivers/watchdog/ep93xx_wdt.c b/drivers/watchdog/ep93xx_wd=
t.c
index 7a2cc7191c58..0a4d7cc05d54 100644
--- a/drivers/watchdog/ep93xx_wdt.c
+++ b/drivers/watchdog/ep93xx_wdt.c
@@ -132,6 +132,7 @@ static int ep93xx_wdt_probe(struct platform_device =
*pdev)
 	val =3D readl(mmio_base + EP93XX_WATCHDOG);
 	ep93xx_wdt_wdd.bootstatus =3D (val & 0x01) ? WDIOF_CARDRESET : 0;
 	ep93xx_wdt_wdd.timeout =3D timeout;
+	ep93xx_wdt_wdd.parent =3D &pdev->dev;
=20
 	watchdog_set_nowayout(&ep93xx_wdt_wdd, nowayout);
=20
diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index 1687cc2d7122..336bddd84809 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -217,6 +217,7 @@ static int gpio_wdt_probe(struct platform_device *p=
dev)
 	priv->wdd.ops		=3D &gpio_wdt_ops;
 	priv->wdd.min_timeout	=3D SOFT_TIMEOUT_MIN;
 	priv->wdd.max_timeout	=3D SOFT_TIMEOUT_MAX;
+	priv->wdd.parent	=3D &pdev->dev;
=20
 	if (watchdog_init_timeout(&priv->wdd, 0, &pdev->dev) < 0)
 		priv->wdd.timeout =3D SOFT_TIMEOUT_DEF;
diff --git a/drivers/watchdog/ie6xx_wdt.c b/drivers/watchdog/ie6xx_wdt.=
c
index 9bc39ae51624..78c2541f5d52 100644
--- a/drivers/watchdog/ie6xx_wdt.c
+++ b/drivers/watchdog/ie6xx_wdt.c
@@ -267,6 +267,7 @@ static int ie6xx_wdt_probe(struct platform_device *=
pdev)
=20
 	ie6xx_wdt_dev.timeout =3D timeout;
 	watchdog_set_nowayout(&ie6xx_wdt_dev, nowayout);
+	ie6xx_wdt_dev.parent =3D &pdev->dev;
=20
 	spin_lock_init(&ie6xx_wdt_data.unlock_sequence);
=20
diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-=
mid_wdt.c
index 84f6701c391f..0a436b5d1e84 100644
--- a/drivers/watchdog/intel-mid_wdt.c
+++ b/drivers/watchdog/intel-mid_wdt.c
@@ -137,6 +137,7 @@ static int mid_wdt_probe(struct platform_device *pd=
ev)
 	wdt_dev->min_timeout =3D MID_WDT_TIMEOUT_MIN;
 	wdt_dev->max_timeout =3D MID_WDT_TIMEOUT_MAX;
 	wdt_dev->timeout =3D MID_WDT_DEFAULT_TIMEOUT;
+	wdt_dev->parent =3D &pdev->dev;
=20
 	watchdog_set_drvdata(wdt_dev, &pdev->dev);
 	platform_set_drvdata(pdev, wdt_dev);
diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wd=
t.c
index 4c2cc09c0c57..6a7d5c365438 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -174,6 +174,7 @@ static int jz4740_wdt_probe(struct platform_device =
*pdev)
 	jz4740_wdt->timeout =3D heartbeat;
 	jz4740_wdt->min_timeout =3D 1;
 	jz4740_wdt->max_timeout =3D MAX_HEARTBEAT;
+	jz4740_wdt->parent =3D &pdev->dev;
 	watchdog_set_nowayout(jz4740_wdt, nowayout);
 	watchdog_set_drvdata(jz4740_wdt, drvdata);
=20
diff --git a/drivers/watchdog/mena21_wdt.c b/drivers/watchdog/mena21_wd=
t.c
index d193a5e79c38..69013007dc47 100644
--- a/drivers/watchdog/mena21_wdt.c
+++ b/drivers/watchdog/mena21_wdt.c
@@ -197,6 +197,7 @@ static int a21_wdt_probe(struct platform_device *pd=
ev)
 	watchdog_init_timeout(&a21_wdt, 30, &pdev->dev);
 	watchdog_set_nowayout(&a21_wdt, nowayout);
 	watchdog_set_drvdata(&a21_wdt, drv);
+	a21_wdt.parent =3D &pdev->dev;
=20
 	reset =3D a21_wdt_get_bootstatus(drv);
 	if (reset =3D=3D 2)
diff --git a/drivers/watchdog/menf21bmc_wdt.c b/drivers/watchdog/menf21=
bmc_wdt.c
index 59f0913c7341..3aefddebb386 100644
--- a/drivers/watchdog/menf21bmc_wdt.c
+++ b/drivers/watchdog/menf21bmc_wdt.c
@@ -130,6 +130,7 @@ static int menf21bmc_wdt_probe(struct platform_devi=
ce *pdev)
 	drv_data->wdt.info =3D &menf21bmc_wdt_info;
 	drv_data->wdt.min_timeout =3D BMC_WD_TIMEOUT_MIN;
 	drv_data->wdt.max_timeout =3D BMC_WD_TIMEOUT_MAX;
+	drv_data->wdt.parent =3D &pdev->dev;
 	drv_data->i2c_client =3D i2c_client;
=20
 	/*
diff --git a/drivers/watchdog/mpc8xxx_wdt.c b/drivers/watchdog/mpc8xxx_=
wdt.c
index 689381a24887..21eda27686c5 100644
--- a/drivers/watchdog/mpc8xxx_wdt.c
+++ b/drivers/watchdog/mpc8xxx_wdt.c
@@ -185,6 +185,7 @@ static int mpc8xxx_wdt_probe(struct platform_device=
 *ofdev)
 		timeout_sec =3D timeout / freq;
=20
 	mpc8xxx_wdt_dev.timeout =3D timeout_sec;
+	mpc8xxx_wdt_dev.parent =3D &ofdev->dev;
 #ifdef MODULE
 	ret =3D mpc8xxx_wdt_init_late();
 	if (ret)
diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index de911c7e477c..d96bee017fd3 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -253,6 +253,7 @@ static int omap_wdt_probe(struct platform_device *p=
dev)
 	wdev->wdog.ops =3D &omap_wdt_ops;
 	wdev->wdog.min_timeout =3D TIMER_MARGIN_MIN;
 	wdev->wdog.max_timeout =3D TIMER_MARGIN_MAX;
+	wdev->wdog.parent =3D &pdev->dev;
=20
 	if (watchdog_init_timeout(&wdev->wdog, timer_margin, &pdev->dev) < 0)
 		wdev->wdog.timeout =3D TIMER_MARGIN_DEFAULT;
diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.=
c
index ef0c628d5037..c6b8f4a43bde 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -567,6 +567,7 @@ static int orion_wdt_probe(struct platform_device *=
pdev)
=20
 	dev->wdt.timeout =3D wdt_max_duration;
 	dev->wdt.max_timeout =3D wdt_max_duration;
+	dev->wdt.parent =3D &pdev->dev;
 	watchdog_init_timeout(&dev->wdt, heartbeat, &pdev->dev);
=20
 	platform_set_drvdata(pdev, &dev->wdt);
diff --git a/drivers/watchdog/pnx4008_wdt.c b/drivers/watchdog/pnx4008_=
wdt.c
index b9c6049c3e78..4224b3ec83a5 100644
--- a/drivers/watchdog/pnx4008_wdt.c
+++ b/drivers/watchdog/pnx4008_wdt.c
@@ -167,6 +167,7 @@ static int pnx4008_wdt_probe(struct platform_device=
 *pdev)
=20
 	pnx4008_wdd.bootstatus =3D (readl(WDTIM_RES(wdt_base)) & WDOG_RESET) =
?
 			WDIOF_CARDRESET : 0;
+	pnx4008_wdd.parent =3D &pdev->dev;
 	watchdog_set_nowayout(&pnx4008_wdd, nowayout);
=20
 	pnx4008_wdt_stop(&pnx4008_wdd);	/* disable for now */
diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index aa03ca8f2d9b..773dcfaee7b2 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -171,6 +171,7 @@ static int qcom_wdt_probe(struct platform_device *p=
dev)
 	wdt->wdd.ops =3D &qcom_wdt_ops;
 	wdt->wdd.min_timeout =3D 1;
 	wdt->wdd.max_timeout =3D 0x10000000U / wdt->rate;
+	wdt->wdd.parent =3D &pdev->dev;
=20
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
diff --git a/drivers/watchdog/retu_wdt.c b/drivers/watchdog/retu_wdt.c
index b7c68e275aeb..39cd51df2ffc 100644
--- a/drivers/watchdog/retu_wdt.c
+++ b/drivers/watchdog/retu_wdt.c
@@ -127,6 +127,7 @@ static int retu_wdt_probe(struct platform_device *p=
dev)
 	retu_wdt->timeout	=3D RETU_WDT_MAX_TIMER;
 	retu_wdt->min_timeout	=3D 0;
 	retu_wdt->max_timeout	=3D RETU_WDT_MAX_TIMER;
+	retu_wdt->parent	=3D &pdev->dev;
=20
 	watchdog_set_drvdata(retu_wdt, wdev);
 	watchdog_set_nowayout(retu_wdt, nowayout);
diff --git a/drivers/watchdog/rt2880_wdt.c b/drivers/watchdog/rt2880_wd=
t.c
index a6f7e2e29beb..1967919ae743 100644
--- a/drivers/watchdog/rt2880_wdt.c
+++ b/drivers/watchdog/rt2880_wdt.c
@@ -161,6 +161,7 @@ static int rt288x_wdt_probe(struct platform_device =
*pdev)
 	rt288x_wdt_dev.dev =3D &pdev->dev;
 	rt288x_wdt_dev.bootstatus =3D rt288x_wdt_bootcause();
 	rt288x_wdt_dev.max_timeout =3D (0xfffful / rt288x_wdt_freq);
+	rt288x_wdt_dev.parent =3D &pdev->dev;
=20
 	watchdog_init_timeout(&rt288x_wdt_dev, rt288x_wdt_dev.max_timeout,
 			      &pdev->dev);
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_=
wdt.c
index e89ae027c91d..d781000c7825 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -607,6 +607,7 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
 	watchdog_set_nowayout(&wdt->wdt_device, nowayout);
=20
 	wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus(wdt);
+	wdt->wdt_device.parent =3D &pdev->dev;
=20
 	ret =3D watchdog_register_device(&wdt->wdt_device);
 	if (ret) {
diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index 567458b137a6..f90812170657 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -252,6 +252,7 @@ static int sh_wdt_probe(struct platform_device *pde=
v)
=20
 	watchdog_set_nowayout(&sh_wdt_dev, nowayout);
 	watchdog_set_drvdata(&sh_wdt_dev, wdt);
+	sh_wdt_dev.parent =3D &pdev->dev;
=20
 	spin_lock_init(&wdt->lock);
=20
diff --git a/drivers/watchdog/sirfsoc_wdt.c b/drivers/watchdog/sirfsoc_=
wdt.c
index 42fa5c0c518a..d0578ab2e636 100644
--- a/drivers/watchdog/sirfsoc_wdt.c
+++ b/drivers/watchdog/sirfsoc_wdt.c
@@ -154,6 +154,7 @@ static int sirfsoc_wdt_probe(struct platform_device=
 *pdev)
=20
 	watchdog_init_timeout(&sirfsoc_wdd, timeout, &pdev->dev);
 	watchdog_set_nowayout(&sirfsoc_wdd, nowayout);
+	sirfsoc_wdd.parent =3D &pdev->dev;
=20
 	ret =3D watchdog_register_device(&sirfsoc_wdd);
 	if (ret)
diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.=
c
index 4e7fec36f5c3..01d816251302 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -226,6 +226,7 @@ sp805_wdt_probe(struct amba_device *adev, const str=
uct amba_id *id)
 	wdt->adev =3D adev;
 	wdt->wdd.info =3D &wdt_info;
 	wdt->wdd.ops =3D &wdt_ops;
+	wdt->wdd.parent =3D &adev->dev;
=20
 	spin_lock_init(&wdt->lock);
 	watchdog_set_nowayout(&wdt->wdd, nowayout);
diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wd=
t.c
index 6785afdc0fca..14e9badf2bfa 100644
--- a/drivers/watchdog/st_lpc_wdt.c
+++ b/drivers/watchdog/st_lpc_wdt.c
@@ -241,6 +241,7 @@ static int st_wdog_probe(struct platform_device *pd=
ev)
 		return -EINVAL;
 	}
 	st_wdog_dev.max_timeout =3D 0xFFFFFFFF / st_wdog->clkrate;
+	st_wdog_dev.parent =3D &pdev->dev;
=20
 	ret =3D clk_prepare_enable(clk);
 	if (ret) {
diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stm=
p3xxx_rtc_wdt.c
index e7f0d5b60d3d..3ee6128a540e 100644
--- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
+++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
@@ -76,6 +76,7 @@ static int stmp3xxx_wdt_probe(struct platform_device =
*pdev)
 	watchdog_set_drvdata(&stmp3xxx_wdd, &pdev->dev);
=20
 	stmp3xxx_wdd.timeout =3D clamp_t(unsigned, heartbeat, 1, STMP3XXX_MAX=
_TIMEOUT);
+	stmp3xxx_wdd.parent =3D &pdev->dev;
=20
 	ret =3D watchdog_register_device(&stmp3xxx_wdd);
 	if (ret < 0) {
diff --git a/drivers/watchdog/tegra_wdt.c b/drivers/watchdog/tegra_wdt.=
c
index 30451ea46902..7f97cdd53f29 100644
--- a/drivers/watchdog/tegra_wdt.c
+++ b/drivers/watchdog/tegra_wdt.c
@@ -218,6 +218,7 @@ static int tegra_wdt_probe(struct platform_device *=
pdev)
 	wdd->ops =3D &tegra_wdt_ops;
 	wdd->min_timeout =3D MIN_WDT_TIMEOUT;
 	wdd->max_timeout =3D MAX_WDT_TIMEOUT;
+	wdd->parent =3D &pdev->dev;
=20
 	watchdog_set_drvdata(wdd, wdt);
=20
diff --git a/drivers/watchdog/twl4030_wdt.c b/drivers/watchdog/twl4030_=
wdt.c
index 2c1db6fa9a27..9bf3cc0f3961 100644
--- a/drivers/watchdog/twl4030_wdt.c
+++ b/drivers/watchdog/twl4030_wdt.c
@@ -83,6 +83,7 @@ static int twl4030_wdt_probe(struct platform_device *=
pdev)
 	wdt->timeout		=3D 30;
 	wdt->min_timeout	=3D 1;
 	wdt->max_timeout	=3D 30;
+	wdt->parent =3D &pdev->dev;
=20
 	watchdog_set_nowayout(wdt, nowayout);
 	platform_set_drvdata(pdev, wdt);
diff --git a/drivers/watchdog/txx9wdt.c b/drivers/watchdog/txx9wdt.c
index 7f615933d31a..c2da880292bc 100644
--- a/drivers/watchdog/txx9wdt.c
+++ b/drivers/watchdog/txx9wdt.c
@@ -131,6 +131,7 @@ static int __init txx9wdt_probe(struct platform_dev=
ice *dev)
 	txx9wdt.timeout =3D timeout;
 	txx9wdt.min_timeout =3D 1;
 	txx9wdt.max_timeout =3D WD_MAX_TIMEOUT;
+	txx9wdt.parent =3D &dev->dev;
 	watchdog_set_nowayout(&txx9wdt, nowayout);
=20
 	ret =3D watchdog_register_device(&txx9wdt);
diff --git a/drivers/watchdog/ux500_wdt.c b/drivers/watchdog/ux500_wdt.=
c
index 9de09ab00838..37c084353cce 100644
--- a/drivers/watchdog/ux500_wdt.c
+++ b/drivers/watchdog/ux500_wdt.c
@@ -96,6 +96,7 @@ static int ux500_wdt_probe(struct platform_device *pd=
ev)
 			ux500_wdt.max_timeout =3D WATCHDOG_MAX28;
 	}
=20
+	ux500_wdt.parent =3D &pdev->dev;
 	watchdog_set_nowayout(&ux500_wdt, nowayout);
=20
 	/* disable auto off on sleep */
diff --git a/drivers/watchdog/via_wdt.c b/drivers/watchdog/via_wdt.c
index 56369c4f1961..5f9cbc37520d 100644
--- a/drivers/watchdog/via_wdt.c
+++ b/drivers/watchdog/via_wdt.c
@@ -206,6 +206,7 @@ static int wdt_probe(struct pci_dev *pdev,
 		timeout =3D WDT_TIMEOUT;
=20
 	wdt_dev.timeout =3D timeout;
+	wdt_dev.parent =3D &pdev->dev;
 	watchdog_set_nowayout(&wdt_dev, nowayout);
 	if (readl(wdt_mem) & VIA_WDT_FIRED)
 		wdt_dev.bootstatus |=3D WDIOF_CARDRESET;
diff --git a/drivers/watchdog/wm831x_wdt.c b/drivers/watchdog/wm831x_wd=
t.c
index 2fa17e746ff6..8d1184aee932 100644
--- a/drivers/watchdog/wm831x_wdt.c
+++ b/drivers/watchdog/wm831x_wdt.c
@@ -215,6 +215,7 @@ static int wm831x_wdt_probe(struct platform_device =
*pdev)
=20
 	wm831x_wdt->info =3D &wm831x_wdt_info;
 	wm831x_wdt->ops =3D &wm831x_wdt_ops;
+	wm831x_wdt->parent =3D &pdev->dev;
 	watchdog_set_nowayout(wm831x_wdt, nowayout);
 	watchdog_set_drvdata(wm831x_wdt, driver_data);
=20
diff --git a/drivers/watchdog/wm8350_wdt.c b/drivers/watchdog/wm8350_wd=
t.c
index 34d272ada23d..4ab4b8347d45 100644
--- a/drivers/watchdog/wm8350_wdt.c
+++ b/drivers/watchdog/wm8350_wdt.c
@@ -151,6 +151,7 @@ static int wm8350_wdt_probe(struct platform_device =
*pdev)
=20
 	watchdog_set_nowayout(&wm8350_wdt, nowayout);
 	watchdog_set_drvdata(&wm8350_wdt, wm8350);
+	wm8350_wdt.parent =3D &pdev->dev;
=20
 	/* Default to 4s timeout */
 	wm8350_wdt_set_timeout(&wm8350_wdt, 4);
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
