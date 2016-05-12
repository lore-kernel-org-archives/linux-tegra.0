From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH ] pinctrl: tegra: Get rid of parked_reg
Date: Thu, 12 May 2016 19:12:49 +0530
Message-ID: <1463060569-9213-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Remove the use of parked_reg and use parked_bit for to know
whether field is supported or not.

This is fix for the patch
commit 1d18a3f0f0809f6c71f1f6e9e268ee904ce0b588
"pinctrl: tegra: avoid parked_reg and parked_bank

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 91254d0..ad62451 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2030,7 +2030,7 @@ static struct tegra_function tegra20_functions[] = {
 		.tri_reg = -1,					\
 		.drv_reg = ((r) - PINGROUP_REG_A),		\
 		.drv_bank = 3,					\
-		.parked_reg = -1,				\
+		.parked_bit = -1,				\
 		.hsm_bit = hsm_b,				\
 		.schmitt_bit = schmitt_b,			\
 		.lpmd_bit = lpmd_b,				\
-- 
2.1.4

