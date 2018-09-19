From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/2] pinctrl: tegra: do not export tegra_pinctrl_probe
Date: Tue, 18 Sep 2018 18:24:26 -0700
Message-ID: <20180919012427.12439-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, thierry.reding@gmail.com
Cc: jonathanh@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

No user of tegra_pinctrl_probe can be built as a module, hence
exporting the symbol is not necessary. Drop EXPORT_SYMBOL_GPL.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 1aba75897d147..a5008c066bac2 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -737,4 +737,3 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra_pinctrl_probe);
-- 
2.19.0
