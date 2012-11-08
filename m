From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gpio: tegra: read output value when gpio is set in direction_out
Date: Thu, 8 Nov 2012 11:57:27 +0530
Message-ID: <1352356047-24817-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Read the output value when gpio is set for the output mode for
gpio_get_value(). Reading input value in direction out does not
give correct value.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index c7c175a..0fb2ce7 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -135,6 +135,12 @@ static void tegra_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int tegra_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
+	int bit_val = BIT(GPIO_BIT(offset));
+
+	/* If gpio is in output mode then read from the out value */
+	if (tegra_gpio_readl(GPIO_OE(offset)) & bit_val)
+		return !!(tegra_gpio_readl(GPIO_OUT(offset)) & bit_val);
+
 	return (tegra_gpio_readl(GPIO_IN(offset)) >> GPIO_BIT(offset)) & 0x1;
 }
 
-- 
1.7.1.1
