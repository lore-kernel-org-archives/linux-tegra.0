From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 13/24] pinctrl: tegra: Use noirq suspend/resume callbacks
Date: Tue, 23 Jun 2020 13:35:48 -0400
Message-ID: <20200623173559.1355728-13-sashal@kernel.org>
References: <20200623173559.1355728-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200623173559.1355728-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Vidya Sagar <vidyas@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Vidya Sagar <vidyas@nvidia.com>

[ Upstream commit 782b6b69847f34dda330530493ea62b7de3fd06a ]

Use noirq suspend/resume callbacks as other drivers which implement
noirq suspend/resume callbacks (Ex:- PCIe) depend on pinctrl driver to
configure the signals used by their respective devices in the noirq phase.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Link: https://lore.kernel.org/r/20200604174935.26560-1-vidyas@nvidia.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index e9a7cbb9aa336..01bcef2c01bcf 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -685,8 +685,8 @@ static int tegra_pinctrl_resume(struct device *dev)
 }
 
 const struct dev_pm_ops tegra_pinctrl_pm = {
-	.suspend = &tegra_pinctrl_suspend,
-	.resume = &tegra_pinctrl_resume
+	.suspend_noirq = &tegra_pinctrl_suspend,
+	.resume_noirq = &tegra_pinctrl_resume
 };
 
 static bool gpio_node_has_range(const char *compatible)
-- 
2.25.1
