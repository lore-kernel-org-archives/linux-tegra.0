From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] drm/tegra: hdmi: probe deferral error reporting
Date: Fri, 20 Jul 2018 09:55:15 +0200
Message-ID: <20180720075515.26852-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Actually report the error code from devm_regulator_get() which may as
well just be a probe deferral.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 drivers/gpu/drm/tegra/hdmi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0082468f703c..94c182dbb6d0 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1693,14 +1693,16 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
 	if (IS_ERR(hdmi->hdmi)) {
-		dev_err(&pdev->dev, "failed to get HDMI regulator\n");
-		return PTR_ERR(hdmi->hdmi);
+		err = PTR_ERR(hdmi->hdmi);
+		dev_err(&pdev->dev, "failed to get HDMI regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
 	if (IS_ERR(hdmi->pll)) {
-		dev_err(&pdev->dev, "failed to get PLL regulator\n");
-		return PTR_ERR(hdmi->pll);
+		err = PTR_ERR(hdmi->pll);
+		dev_err(&pdev->dev, "failed to get PLL regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
-- 
2.14.4
