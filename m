From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH] pinctrl: tegra1x4: initialize at arch_initcall time
Date: Fri, 10 Jan 2014 16:50:16 -0800
Message-ID: <1389401416-29892-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org

Many devices rely on pinctrl/pinmux settings being applied
before probing and some of these may probe before device_initcall
time (e.g. i2c at subsys_initcall).  Move Tegra1x4 pinctrl driver
registration to arch_initcall time so that proper pin settings
can be applied earlier.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 drivers/pinctrl/pinctrl-tegra114.c | 13 ++++++++++++-
 drivers/pinctrl/pinctrl-tegra124.c | 13 ++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra114.c b/drivers/pinctrl/pinctrl-tegra114.c
index 93c9e38..5d0c950 100644
--- a/drivers/pinctrl/pinctrl-tegra114.c
+++ b/drivers/pinctrl/pinctrl-tegra114.c
@@ -2761,7 +2761,18 @@ static struct platform_driver tegra114_pinctrl_driver = {
 	.probe = tegra114_pinctrl_probe,
 	.remove = tegra_pinctrl_remove,
 };
-module_platform_driver(tegra114_pinctrl_driver);
+
+static int __init tegra114_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra114_pinctrl_driver);
+}
+arch_initcall(tegra114_pinctrl_init);
+
+static void __exit tegra114_pinctrl_exit(void)
+{
+	platform_driver_unregister(&tegra114_pinctrl_driver);
+}
+module_exit(tegra114_pinctrl_exit);
 
 MODULE_AUTHOR("Pritesh Raithatha <praithatha@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra114 pinctrl driver");
diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c
index c20e0e1..02ac976 100644
--- a/drivers/pinctrl/pinctrl-tegra124.c
+++ b/drivers/pinctrl/pinctrl-tegra124.c
@@ -3130,7 +3130,18 @@ static struct platform_driver tegra124_pinctrl_driver = {
 	.probe = tegra124_pinctrl_probe,
 	.remove = tegra_pinctrl_remove,
 };
-module_platform_driver(tegra124_pinctrl_driver);
+
+static int __init tegra124_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra124_pinctrl_driver);
+}
+arch_initcall(tegra124_pinctrl_init);
+
+static void __exit tegra124_pinctrl_exit(void)
+{
+	platform_driver_unregister(&tegra124_pinctrl_driver);
+}
+module_exit(tegra124_pinctrl_exit);
 
 MODULE_AUTHOR("Ashwini Ghuge <aghuge@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra124 pinctrl driver");
-- 
1.8.5.1
