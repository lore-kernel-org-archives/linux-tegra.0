From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: tegra: Fix build error without CONFIG_PM_SLEEP
Date: Wed, 30 Oct 2019 20:56:50 +0800
Message-ID: <20191030125650.36776-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, treding@nvidia.com, jonathanh@nvidia.com, skomatineni@nvidia.com, digetx@gmail.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

If CONFIG_PM_SLEEP is n, build fails:

drivers/clk/tegra/clk-tegra210.c:3426:13: error:
 tegra210_clk_suspend undeclared here (not in a function); did you mean tegra_clk_ndspeed?
  .suspend = tegra210_clk_suspend,
             ^~~~~~~~~~~~~~~~~~~~
             tegra_clk_ndspeed
drivers/clk/tegra/clk-tegra210.c:3427:12: error:
 tegra210_clk_resume undeclared here (not in a function); did you mean tegra210_clk_suspend?
  .resume = tegra210_clk_resume,

Use ifdef to guard this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 27d10d548c04 ("clk: tegra: Add suspend and resume support on Tegra210")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index d038fed..762cd18 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3423,8 +3423,10 @@ static void tegra210_cpu_clock_resume(void)
 #endif
 
 static struct syscore_ops tegra_clk_syscore_ops = {
+#ifdef CONFIG_PM_SLEEP
 	.suspend = tegra210_clk_suspend,
 	.resume = tegra210_clk_resume,
+#endif
 };
 
 static struct tegra_cpu_car_ops tegra210_cpu_car_ops = {
-- 
2.7.4
