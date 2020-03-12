From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] drm/tegra: hdmi: Silence deferred-probe error
Date: Thu, 12 Mar 2020 18:04:32 +0300
Message-ID: <20200312150432.2745-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Driver fails to probe with -EPROBE_DEFER, which produces a bit noisy error
message in KMSG during kernel's boot up. This happens because voltage
regulators tend to be probed later than the DRM driver.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6f117628f257..e8ee8058c587 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1648,6 +1648,7 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
+	const char *err_level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1686,21 +1687,36 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	}
 
 	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
-	if (IS_ERR(hdmi->hdmi)) {
-		dev_err(&pdev->dev, "failed to get HDMI regulator\n");
-		return PTR_ERR(hdmi->hdmi);
+	err = PTR_ERR_OR_ZERO(hdmi->hdmi);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get HDMI regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
-	if (IS_ERR(hdmi->pll)) {
-		dev_err(&pdev->dev, "failed to get PLL regulator\n");
-		return PTR_ERR(hdmi->pll);
+	err = PTR_ERR_OR_ZERO(hdmi->pll);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get PLL regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
-	if (IS_ERR(hdmi->vdd)) {
-		dev_err(&pdev->dev, "failed to get VDD regulator\n");
-		return PTR_ERR(hdmi->vdd);
+	err = PTR_ERR_OR_ZERO(hdmi->vdd);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get VDD regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->output.dev = &pdev->dev;
-- 
2.25.1
