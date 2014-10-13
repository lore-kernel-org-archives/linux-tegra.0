From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/14] gpu: host1x: mipi: Registers are 32 bits wide
Date: Mon, 13 Oct 2014 12:21:47 +0200
Message-ID: <1413195715-4719-6-git-send-email-thierry.reding@gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413195715-4719-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 64-bit platforms an unsigned long would be 64 bit and cause
unnecessary casting when being passed to writel() or returned from
readl(). Make register values 32 bits wide to avoid that.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/mipi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 9882ea122024..a3e215a0116f 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -90,16 +90,16 @@ struct tegra_mipi_device {
 	unsigned long pads;
 };
 
-static inline unsigned long tegra_mipi_readl(struct tegra_mipi *mipi,
-					     unsigned long reg)
+static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
+				   unsigned long offset)
 {
-	return readl(mipi->regs + (reg << 2));
+	return readl(mipi->regs + (offset << 2));
 }
 
-static inline void tegra_mipi_writel(struct tegra_mipi *mipi,
-				     unsigned long value, unsigned long reg)
+static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
+				     unsigned long offset)
 {
-	writel(value, mipi->regs + (reg << 2));
+	writel(value, mipi->regs + (offset << 2));
 }
 
 struct tegra_mipi_device *tegra_mipi_request(struct device *device)
@@ -161,7 +161,7 @@ EXPORT_SYMBOL(tegra_mipi_free);
 static int tegra_mipi_wait(struct tegra_mipi *mipi)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(250);
-	unsigned long value;
+	u32 value;
 
 	while (time_before(jiffies, timeout)) {
 		value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
@@ -177,8 +177,8 @@ static int tegra_mipi_wait(struct tegra_mipi *mipi)
 
 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 {
-	unsigned long value;
 	unsigned int i;
+	u32 value;
 	int err;
 
 	err = clk_enable(device->mipi->clk);
-- 
2.1.2
