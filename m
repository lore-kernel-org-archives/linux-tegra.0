From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/2] pinctrl: tegra: Move drivers registration to arch_init level
Date: Mon,  6 Aug 2018 12:12:06 +0300
Message-ID: <20180806091207.12586-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is a bug in regards to deferred probing within the drivers core
that causes GPIO-driver to suspend before its users. The bug appears if
GPIO-driver probe is getting deferred, which happens after introducing
dependency on PINCTRL-driver for the GPIO-driver by defining "gpio-ranges"
property in device-tree. The bug in the drivers core is old (more than 4
years now) and is well known, unfortunately there is no easy fix for it.
The good news is that we can workaround the deferred probe issue by
changing GPIO / PINCTRL drivers registration order and hence by moving
PINCTRL driver registration to the arch_init level and GPIO to the
subsys_init.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Stefan Agner <stefan@agner.ch>
---

Changelog:

v2: Corrected commit message with s/to suspend after/to suspend before/.



 drivers/pinctrl/tegra/pinctrl-tegra114.c | 7 ++++++-
 drivers/pinctrl/tegra/pinctrl-tegra124.c | 7 ++++++-
 drivers/pinctrl/tegra/pinctrl-tegra20.c  | 7 ++++++-
 drivers/pinctrl/tegra/pinctrl-tegra210.c | 7 ++++++-
 drivers/pinctrl/tegra/pinctrl-tegra30.c  | 7 ++++++-
 5 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index 511a8774fd8d..d43c209e9c30 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1868,4 +1868,9 @@ static struct platform_driver tegra114_pinctrl_driver = {
 	},
 	.probe = tegra114_pinctrl_probe,
 };
-builtin_platform_driver(tegra114_pinctrl_driver);
+
+static int __init tegra114_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra114_pinctrl_driver);
+}
+arch_initcall(tegra114_pinctrl_init);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index 57e3cdcf4503..5b07a5834d15 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -2080,4 +2080,9 @@ static struct platform_driver tegra124_pinctrl_driver = {
 	},
 	.probe = tegra124_pinctrl_probe,
 };
-builtin_platform_driver(tegra124_pinctrl_driver);
+
+static int __init tegra124_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra124_pinctrl_driver);
+}
+arch_initcall(tegra124_pinctrl_init);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 624889ed3a9d..1fc82a9576e0 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2277,4 +2277,9 @@ static struct platform_driver tegra20_pinctrl_driver = {
 	},
 	.probe = tegra20_pinctrl_probe,
 };
-builtin_platform_driver(tegra20_pinctrl_driver);
+
+static int __init tegra20_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra20_pinctrl_driver);
+}
+arch_initcall(tegra20_pinctrl_init);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 0956a1c73391..3e77f5474dd8 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1582,4 +1582,9 @@ static struct platform_driver tegra210_pinctrl_driver = {
 	},
 	.probe = tegra210_pinctrl_probe,
 };
-builtin_platform_driver(tegra210_pinctrl_driver);
+
+static int __init tegra210_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra210_pinctrl_driver);
+}
+arch_initcall(tegra210_pinctrl_init);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index c923ad58af84..10e617003e9c 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -2503,4 +2503,9 @@ static struct platform_driver tegra30_pinctrl_driver = {
 	},
 	.probe = tegra30_pinctrl_probe,
 };
-builtin_platform_driver(tegra30_pinctrl_driver);
+
+static int __init tegra30_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra30_pinctrl_driver);
+}
+arch_initcall(tegra30_pinctrl_init);
-- 
2.18.0
