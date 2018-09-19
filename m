From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] pinctrl: tegra: move probe to __init section
Date: Tue, 18 Sep 2018 18:24:27 -0700
Message-ID: <20180919012427.12439-2-stefan@agner.ch>
References: <20180919012427.12439-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919012427.12439-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, thierry.reding@gmail.com
Cc: jonathanh@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

The Tegra pinctrl drivers are always built-in. This allows to use
platform_driver_probe() and mark several functions as __init.
This allows the kernel to free about 1KiB of memory if Tegra
pinctrl drivers are not used.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 6 +++---
 drivers/pinctrl/tegra/pinctrl-tegra114.c | 6 +++---
 drivers/pinctrl/tegra/pinctrl-tegra124.c | 6 +++---
 drivers/pinctrl/tegra/pinctrl-tegra20.c  | 6 +++---
 drivers/pinctrl/tegra/pinctrl-tegra30.c  | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index a5008c066bac2..c263cb66a0287 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -613,7 +613,7 @@ static struct pinctrl_desc tegra_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
-static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
+static void __init tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 {
 	int i = 0;
 	const struct tegra_pingroup *g;
@@ -629,7 +629,7 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 	}
 }
 
-static bool gpio_node_has_range(const char *compatible)
+static bool __init gpio_node_has_range(const char *compatible)
 {
 	struct device_node *np;
 	bool has_prop = false;
@@ -645,7 +645,7 @@ static bool gpio_node_has_range(const char *compatible)
 	return has_prop;
 }
 
-int tegra_pinctrl_probe(struct platform_device *pdev,
+int __init tegra_pinctrl_probe(struct platform_device *pdev,
 			const struct tegra_pinctrl_soc_data *soc_data)
 {
 	struct tegra_pmx *pmx;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index d43c209e9c30b..db1b970478146 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1851,7 +1851,7 @@ static const struct tegra_pinctrl_soc_data tegra114_pinctrl = {
 	.drvtype_in_mux = false,
 };
 
-static int tegra114_pinctrl_probe(struct platform_device *pdev)
+static int __init tegra114_pinctrl_probe(struct platform_device *pdev)
 {
 	return tegra_pinctrl_probe(pdev, &tegra114_pinctrl);
 }
@@ -1866,11 +1866,11 @@ static struct platform_driver tegra114_pinctrl_driver = {
 		.name = "tegra114-pinctrl",
 		.of_match_table = tegra114_pinctrl_of_match,
 	},
-	.probe = tegra114_pinctrl_probe,
 };
 
 static int __init tegra114_pinctrl_init(void)
 {
-	return platform_driver_register(&tegra114_pinctrl_driver);
+	return platform_driver_probe(&tegra114_pinctrl_driver,
+				     tegra114_pinctrl_probe);
 }
 arch_initcall(tegra114_pinctrl_init);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index 5b07a5834d155..38c08cbbd90aa 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -2063,7 +2063,7 @@ static const struct tegra_pinctrl_soc_data tegra124_pinctrl = {
 	.drvtype_in_mux = false,
 };
 
-static int tegra124_pinctrl_probe(struct platform_device *pdev)
+static int __init tegra124_pinctrl_probe(struct platform_device *pdev)
 {
 	return tegra_pinctrl_probe(pdev, &tegra124_pinctrl);
 }
@@ -2078,11 +2078,11 @@ static struct platform_driver tegra124_pinctrl_driver = {
 		.name = "tegra124-pinctrl",
 		.of_match_table = tegra124_pinctrl_of_match,
 	},
-	.probe = tegra124_pinctrl_probe,
 };
 
 static int __init tegra124_pinctrl_init(void)
 {
-	return platform_driver_register(&tegra124_pinctrl_driver);
+	return platform_driver_probe(&tegra124_pinctrl_driver,
+				     tegra124_pinctrl_probe);
 }
 arch_initcall(tegra124_pinctrl_init);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 1fc82a9576e06..205857b6ba256 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2252,7 +2252,7 @@ static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 			 pmx->regs[1] + 0x8, 4, 2, CLK_MUX_READ_ONLY, NULL);
 }
 
-static int tegra20_pinctrl_probe(struct platform_device *pdev)
+static int __init tegra20_pinctrl_probe(struct platform_device *pdev)
 {
 	int err;
 
@@ -2275,11 +2275,11 @@ static struct platform_driver tegra20_pinctrl_driver = {
 		.name = "tegra20-pinctrl",
 		.of_match_table = tegra20_pinctrl_of_match,
 	},
-	.probe = tegra20_pinctrl_probe,
 };
 
 static int __init tegra20_pinctrl_init(void)
 {
-	return platform_driver_register(&tegra20_pinctrl_driver);
+	return platform_driver_probe(&tegra20_pinctrl_driver,
+				     tegra20_pinctrl_probe);
 }
 arch_initcall(tegra20_pinctrl_init);
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index 10e617003e9ce..5996cb7241134 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -2486,7 +2486,7 @@ static const struct tegra_pinctrl_soc_data tegra30_pinctrl = {
 	.drvtype_in_mux = false,
 };
 
-static int tegra30_pinctrl_probe(struct platform_device *pdev)
+static int __init tegra30_pinctrl_probe(struct platform_device *pdev)
 {
 	return tegra_pinctrl_probe(pdev, &tegra30_pinctrl);
 }
@@ -2501,11 +2501,11 @@ static struct platform_driver tegra30_pinctrl_driver = {
 		.name = "tegra30-pinctrl",
 		.of_match_table = tegra30_pinctrl_of_match,
 	},
-	.probe = tegra30_pinctrl_probe,
 };
 
 static int __init tegra30_pinctrl_init(void)
 {
-	return platform_driver_register(&tegra30_pinctrl_driver);
+	return platform_driver_probe(&tegra30_pinctrl_driver,
+				     tegra30_pinctrl_probe);
 }
 arch_initcall(tegra30_pinctrl_init);
-- 
2.19.0
