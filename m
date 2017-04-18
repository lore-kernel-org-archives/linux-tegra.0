From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH V3 3/4] usb: dwc3: of-simple: Add support to get resets for the device
Date: Tue, 18 Apr 2017 16:51:27 +0530
Message-ID: <1492514488-27385-4-git-send-email-vivek.gautam@codeaurora.org>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, swarren@wwwdotorg.org, balbi@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, thierry.reding@gmail.com, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Add support to get a list of resets available for the device.
These resets must be kept de-asserted until the device is
in use.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index fe414e7a9c78..9116df649f0b 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -29,13 +29,39 @@
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
 
+static int dwc3_of_simple_reset_init(struct dwc3_of_simple *simple)
+{
+	struct device		*dev = simple->dev;
+	int			ret;
+
+	simple->resets = of_reset_control_array_get_exclusive(dev->of_node);
+	if (IS_ERR(simple->resets)) {
+		ret = PTR_ERR(simple->resets);
+		if (ret == -ENOENT)
+			/* not all controllers required resets */
+			return 0;
+		dev_err(dev, "failed to get device resets\n");
+		return ret;
+	}
+
+	ret = reset_control_array_deassert(simple->resets);
+	if (ret) {
+		reset_control_array_put(simple->resets);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int dwc3_of_simple_clk_init(struct dwc3_of_simple *simple, int count)
 {
 	struct device		*dev = simple->dev;
@@ -100,6 +126,10 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dwc3_of_simple_reset_init(simple);
+	if (ret)
+		return ret;
+
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
 		for (i = 0; i < simple->num_clocks; i++) {
@@ -107,6 +137,9 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 			clk_put(simple->clks[i]);
 		}
 
+		reset_control_array_assert(simple->resets);
+		reset_control_array_put(simple->resets);
+
 		return ret;
 	}
 
@@ -128,6 +161,9 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 		clk_put(simple->clks[i]);
 	}
 
+	reset_control_array_assert(simple->resets);
+	reset_control_array_put(simple->resets);
+
 	of_platform_depopulate(dev);
 
 	pm_runtime_put_sync(dev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
