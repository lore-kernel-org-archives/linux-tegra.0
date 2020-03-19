From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/9] pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
Date: Thu, 19 Mar 2020 13:27:33 +0100
Message-ID: <20200319122737.3063291-6-thierry.reding@gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200319122737.3063291-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Properly spell "Schmitt" in the kerneldoc for pin group definitions.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index 0fc82eea9cf1..520865979d4a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -107,7 +107,7 @@ struct tegra_function {
  *			drvup, slwr, slwf, and drvtype parameters.
  * @drv_bank:		Drive fields register bank.
  * @hsm_bit:		High Speed Mode register bit.
- * @schmitt_bit:	Scmitt register bit.
+ * @schmitt_bit:	Schmitt register bit.
  * @lpmd_bit:		Low Power Mode register bit.
  * @drvdn_bit:		Drive Down register bit.
  * @drvdn_width:	Drive Down field width.
-- 
2.24.1
