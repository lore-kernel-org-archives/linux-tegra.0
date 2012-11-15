From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 RESEND] gpio: tegra: read output value when gpio is set in direction_out
Date: Fri, 16 Nov 2012 04:34:06 +0530
Message-ID: <1353020646-14867-1-git-send-email-ldewangan@nvidia.com>
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
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from V1:
- Keep the if part implementation same the else part to have implementation
  same kind.

Not too old patchi but just resending in case of it is missed.
Adding acked by Stephen as he acked this patch.


 drivers/gpio/gpio-tegra.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index c7c175a..1163cf1 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -135,6 +135,11 @@ static void tegra_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int tegra_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
+	/* If gpio is in output mode then read from the out value */
+	if ((tegra_gpio_readl(GPIO_OE(offset)) >> GPIO_BIT(offset)) & 1)
+		return (tegra_gpio_readl(GPIO_OUT(offset)) >>
+				GPIO_BIT(offset)) & 0x1;
+
 	return (tegra_gpio_readl(GPIO_IN(offset)) >> GPIO_BIT(offset)) & 0x1;
 }
 
-- 
1.7.1.1
