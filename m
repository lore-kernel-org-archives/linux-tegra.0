From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 4/6] usb: dwc3: of-simple: Re-order resource handling in remove
Date: Thu,  1 Jun 2017 18:52:01 +0200
Message-ID: <20170601165203.15315-5-p.zabel@pengutronix.de>
References: <20170601165203.15315-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170601165203.15315-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Vivek Gautam <vivek.gautam@codeaurora.org>

Move clock handling after of_platform_depopulate to achieve
a sequence that is reverse of the probe sequence.

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index fe414e7a9c78c..a9bac09d3750d 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -123,13 +123,13 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	int			i;
 
+	of_platform_depopulate(dev);
+
 	for (i = 0; i < simple->num_clocks; i++) {
 		clk_disable_unprepare(simple->clks[i]);
 		clk_put(simple->clks[i]);
 	}
 
-	of_platform_depopulate(dev);
-
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
-- 
2.11.0
