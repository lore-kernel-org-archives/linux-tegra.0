From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v4 3/4] usb: dwc3: of-simple: Add support to get resets for the device
Date: Mon, 22 May 2017 16:53:26 +0530
Message-ID: <1495452207-6129-4-git-send-email-vivek.gautam@codeaurora.org>
References: <1495452207-6129-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495452207-6129-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, jonathanh@nvidia.com, balbi@kernel.org, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Add support to get a list of resets available for the device.
These resets must be kept de-asserted until the device is
in use.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index a9bac09d3750..463b744d6688 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -29,11 +29,13 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 struct dwc3_of_simple {
 	struct device		*dev;
 	struct clk		**clks;
 	int			num_clocks;
+	struct reset_control_array *resets;
 };
 
 static int dwc3_of_simple_clk_init(struct dwc3_of_simple *simple, int count)
@@ -96,9 +98,20 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, simple);
 	simple->dev = dev;
 
+	simple->resets = of_reset_control_array_get_optional_exclusive(np);
+	if (IS_ERR(simple->resets)) {
+		ret = PTR_ERR(simple->resets);
+		dev_err(dev, "failed to get device resets, err=%d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_array_deassert(simple->resets);
+	if (ret)
+		goto err_resetc_put;
+
 	ret = dwc3_of_simple_clk_init(simple, of_clk_get_parent_count(np));
 	if (ret)
-		return ret;
+		goto err_resetc_assert;
 
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
@@ -107,7 +120,7 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 			clk_put(simple->clks[i]);
 		}
 
-		return ret;
+		goto err_resetc_assert;
 	}
 
 	pm_runtime_set_active(dev);
@@ -115,6 +128,13 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	pm_runtime_get_sync(dev);
 
 	return 0;
+
+err_resetc_assert:
+	reset_control_array_assert(simple->resets);
+
+err_resetc_put:
+	reset_control_array_put(simple->resets);
+	return ret;
 }
 
 static int dwc3_of_simple_remove(struct platform_device *pdev)
@@ -130,6 +150,9 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 		clk_put(simple->clks[i]);
 	}
 
+	reset_control_array_assert(simple->resets);
+	reset_control_array_put(simple->resets);
+
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
