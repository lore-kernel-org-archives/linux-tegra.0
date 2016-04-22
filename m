From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V4 2/4] gpio: tegra: Make of_device_id compatible data to constant
Date: Fri, 22 Apr 2016 15:39:12 +0530
Message-ID: <1461319754-12040-2-git-send-email-ldewangan@nvidia.com>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The data member of the of_device_id is the constant type
and hence all static structure which is used for this
initialisation as static.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Suggested-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Stephen Warren <swarren@nvidia.com>

---
Changes from V2:
-This is new in series based on discussion on previous patches.

Changes from V3:
- Collected RB of Stephen.

 drivers/gpio/gpio-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 1b0c497..cd69422 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -560,12 +560,12 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct tegra_gpio_soc_config tegra20_gpio_config = {
+static const struct tegra_gpio_soc_config tegra20_gpio_config = {
 	.bank_stride = 0x80,
 	.upper_offset = 0x800,
 };
 
-static struct tegra_gpio_soc_config tegra30_gpio_config = {
+static const struct tegra_gpio_soc_config tegra30_gpio_config = {
 	.bank_stride = 0x100,
 	.upper_offset = 0x80,
 };
-- 
2.1.4
