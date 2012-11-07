From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] gpio: tegra: create irq mapping in gpio_to_irq
Date: Wed, 7 Nov 2012 20:31:31 +0530
Message-ID: <1352300492-24779-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The gpio interrupts get mapped linearly and hence the mapping
of irq need to be created by irq_create_mapping().

The function gpio_to_irq() returns the irq by irq_find_mapping()
and so returns 0 as there is no mapping created. Fix the function
to create mapping when gpio_to_irq() get called.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index c7c175a..6c08613 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -156,7 +156,7 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 
 static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	return irq_find_mapping(irq_domain, offset);
+	return irq_create_mapping(irq_domain, offset);
 }
 
 static struct gpio_chip tegra_gpio_chip = {
-- 
1.7.1.1
