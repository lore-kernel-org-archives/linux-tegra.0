From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] rtc: tegra: Implement clock handling
Date: Thu, 12 Jan 2017 17:07:43 +0100
Message-ID: <20170112160743.23367-2-thierry.reding@gmail.com>
References: <20170112160743.23367-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170112160743.23367-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Accessing the registers of the RTC block on Tegra requires the module
clock to be enabled. This only works because the RTC module clock will
be enabled by default during early boot. However, because the clock is
unused, the CCF will disable it at late_init time. This causes the RTC
to become unusable afterwards. This can easily be reproduced by trying
to use the RTC:

	$ hwclock --rtc /dev/rtc1

This will hang the system. I ran into this by following up on a report
by Martin Michlmayr that reboot wasn't working on Tegra210 systems. It
turns out that the rtc-tegra driver's ->shutdown() implementation will
hang the CPU, because of the disabled clock, before the system can be
rebooted.

What confused me for a while is that the same driver is used on prior
Tegra generations where the hang can not be observed. However, as Peter
De Schrijver pointed out, this is because on 32-bit Tegra chips the RTC
clock is enabled by the tegra20_timer.c clocksource driver, which uses
the RTC to provide a persistent clock. This code is never enabled on
64-bit Tegra because the persistent clock infrastructure does not exist
of 64-bit ARM.

The proper fix for this is to add proper clock handling to the RTC
driver in order to ensure that the clock is enabled when the driver
requires it. All device trees contain the clock already, therefore
no additional changes are required.

Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reported-by: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/rtc/rtc-tegra.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 38e662ff1a70..d30d57b048d3 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -18,6 +18,7 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -60,6 +61,7 @@ struct tegra_rtc_info {
 	struct platform_device	*pdev;
 	struct rtc_device	*rtc_dev;
 	void __iomem		*rtc_base; /* NULL if not initialized. */
+	struct clk		*clk;
 	int			tegra_rtc_irq; /* alarm and periodic irq */
 	spinlock_t		tegra_rtc_lock;
 };
@@ -327,6 +329,14 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 	if (info->tegra_rtc_irq <= 0)
 		return -EBUSY;
 
+	info->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(info->clk))
+		return PTR_ERR(info->clk);
+
+	ret = clk_prepare_enable(info->clk);
+	if (ret < 0)
+		return ret;
+
 	/* set context info. */
 	info->pdev = pdev;
 	spin_lock_init(&info->tegra_rtc_lock);
@@ -347,7 +357,7 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 		ret = PTR_ERR(info->rtc_dev);
 		dev_err(&pdev->dev, "Unable to register device (err=%d).\n",
 			ret);
-		return ret;
+		goto disable_clk;
 	}
 
 	ret = devm_request_irq(&pdev->dev, info->tegra_rtc_irq,
@@ -357,12 +367,25 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"Unable to request interrupt for device (err=%d).\n",
 			ret);
-		return ret;
+		goto disable_clk;
 	}
 
 	dev_notice(&pdev->dev, "Tegra internal Real Time Clock\n");
 
 	return 0;
+
+disable_clk:
+	clk_disable_unprepare(info->clk);
+	return ret;
+}
+
+static int tegra_rtc_remove(struct platform_device *pdev)
+{
+	struct tegra_rtc_info *info = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(info->clk);
+
+	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -414,6 +437,7 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
 
 MODULE_ALIAS("platform:tegra_rtc");
 static struct platform_driver tegra_rtc_driver = {
+	.remove		= tegra_rtc_remove,
 	.shutdown	= tegra_rtc_shutdown,
 	.driver		= {
 		.name	= "tegra_rtc",
-- 
2.11.0
