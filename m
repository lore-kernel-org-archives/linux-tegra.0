From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] pinctrl: tegra: Use noirq suspend/resume callbacks
Date: Thu, 4 Jun 2020 23:19:35 +0530
Message-ID: <20200604174935.26560-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Use noirq suspend/resume callbacks as other drivers which implement
noirq suspend/resume callbacks (Ex:- PCIe) depend on pinctrl driver to
configure the signals used by their respective devices in the noirq phase.

Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 21661f6490d6..195cfe557511 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -731,8 +731,8 @@ static int tegra_pinctrl_resume(struct device *dev)
 }
 
 const struct dev_pm_ops tegra_pinctrl_pm = {
-	.suspend = &tegra_pinctrl_suspend,
-	.resume = &tegra_pinctrl_resume
+	.suspend_noirq = &tegra_pinctrl_suspend,
+	.resume_noirq = &tegra_pinctrl_resume
 };
 
 static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *pmx)
-- 
2.17.1
