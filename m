From: Ameya Palande <2ameya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] arm: tegra: Remove unused variable 'i'
Date: Fri, 15 Apr 2011 15:10:08 +0300
Message-ID: <1302869408-7291-1-git-send-email-2ameya@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Ameya Palande <2ameya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-tegra/gpio.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/gpio.c b/arch/arm/mach-tegra/gpio.c
index 76a3f65..68069fa 100644
--- a/arch/arm/mach-tegra/gpio.c
+++ b/arch/arm/mach-tegra/gpio.c
@@ -257,7 +257,7 @@ static void tegra_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 void tegra_gpio_resume(void)
 {
 	unsigned long flags;
-	int b, p, i;
+	int b, p;
 
 	local_irq_save(flags);
 
@@ -280,7 +280,7 @@ void tegra_gpio_resume(void)
 void tegra_gpio_suspend(void)
 {
 	unsigned long flags;
-	int b, p, i;
+	int b, p;
 
 	local_irq_save(flags);
 	for (b = 0; b < ARRAY_SIZE(tegra_gpio_banks); b++) {
-- 
1.7.1
