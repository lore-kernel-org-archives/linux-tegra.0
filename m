From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 1/2] cpufreq: kirkwood: convert to devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 14:05:21 +0000
Message-ID: <20191215140522.30872-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rjw@rjwysocki.net, viresh.kumar@linaro.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/cpufreq/kirkwood-cpufreq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
index cb74bdc5baaa..70ad8fe1d78b 100644
--- a/drivers/cpufreq/kirkwood-cpufreq.c
+++ b/drivers/cpufreq/kirkwood-cpufreq.c
@@ -102,13 +102,11 @@ static struct cpufreq_driver kirkwood_cpufreq_driver = {
 static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
-	struct resource *res;
 	int err;
 
 	priv.dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv.base = devm_ioremap_resource(&pdev->dev, res);
+	priv.base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv.base))
 		return PTR_ERR(priv.base);
 
-- 
2.17.1
