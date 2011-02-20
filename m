From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] ARM: tegra: Fix typo in TEGRA_IRQ_TO_GPIO
Date: Sat, 19 Feb 2011 20:38:54 -0700
Message-ID: <1298173137-9242-2-git-send-email-swarren@nvidia.com>
References: <1298173137-9242-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298173137-9242-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/gpio.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/gpio.h b/arch/arm/mach-tegra/include/mach/gpio.h
index e31f486..12a7cf6 100644
--- a/arch/arm/mach-tegra/include/mach/gpio.h
+++ b/arch/arm/mach-tegra/include/mach/gpio.h
@@ -31,7 +31,7 @@
 #define gpio_cansleep		__gpio_cansleep
 
 #define TEGRA_GPIO_TO_IRQ(gpio) (INT_GPIO_BASE + (gpio))
-#define TEGRA_IRQ_TO_GPIO(irq) ((gpio) - INT_GPIO_BASE)
+#define TEGRA_IRQ_TO_GPIO(irq) ((irq) - INT_GPIO_BASE)
 
 static inline int gpio_to_irq(unsigned int gpio)
 {
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
