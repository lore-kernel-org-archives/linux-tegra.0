From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v1 2/3] pinctrl: tegra: Only set the gpio range if needed
Date: Wed,  1 Jul 2015 14:45:52 +0200
Message-ID: <1435754753-31307-3-git-send-email-tomeu.vizoso@collabora.com>
References: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1435754753-31307-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

If the gpio DT node has the gpio-ranges property, the range will be
added by the gpio core and doesn't need to be added by the pinctrl
driver.

By having the gpio-ranges property, we have an explicit dependency from
the gpio node to the pinctrl node and we can stop using the deprecated
pinctrl_add_gpio_range() function.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

 drivers/pinctrl/pinctrl-tegra.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 0f982b8..0fd7fd2 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -624,6 +624,22 @@ static struct pinctrl_desc tegra_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static bool gpio_node_has_range(void)
+{
+	struct device_node *np;
+	bool has_prop = false;
+
+	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra30-gpio");
+	if (!np)
+		return has_prop;
+
+	has_prop = of_find_property(np, "gpio-ranges", NULL);
+
+	of_node_put(np);
+
+	return has_prop;
+}
+
 int tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data)
 {
@@ -708,7 +724,8 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pmx->pctl);
 	}
 
-	pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
+	if (!gpio_node_has_range())
+		pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
 
 	platform_set_drvdata(pdev, pmx);
 
-- 
2.4.1

