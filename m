From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/9] pinctrl: tegra: Pass struct tegra_pmx for pin range check
Date: Thu, 19 Mar 2020 13:27:34 +0100
Message-ID: <20200319122737.3063291-7-thierry.reding@gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Pass the struct tegra_pmx when checking for the pin range in device
tree. This makes the call site a bit easier to read and will help keep
that readability in a subsequent patch.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index cefbbb8d1a68..c8246cc2c4fd 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -689,12 +689,12 @@ const struct dev_pm_ops tegra_pinctrl_pm = {
 	.resume = &tegra_pinctrl_resume
 };
 
-static bool gpio_node_has_range(const char *compatible)
+static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *pmx)
 {
 	struct device_node *np;
 	bool has_prop = false;
 
-	np = of_find_compatible_node(NULL, NULL, compatible);
+	np = of_find_compatible_node(NULL, NULL, pmx->soc->gpio_compatible);
 	if (!np)
 		return has_prop;
 
@@ -794,7 +794,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	tegra_pinctrl_clear_parked_bits(pmx);
 
-	if (!gpio_node_has_range(pmx->soc->gpio_compatible))
+	if (!tegra_pinctrl_gpio_node_has_range(pmx))
 		pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
 
 	platform_set_drvdata(pdev, pmx);
-- 
2.24.1
