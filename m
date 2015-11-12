From: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Subject: [PATCH v2 repost] ARM: Availability of psci_smp_available depends on  CONFIG_SMP
Date: Thu, 12 Nov 2015 11:06:18 +0100
Message-ID: <1447322778-5237-1-git-send-email-sebastian@breakpoint.cc>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>

Ensure that we can use psci_smp_available without checking for
CONFIG_SMP first (CONFIG_ARM_PSCI=y, CONFIG_SMP=n and
CONFIG_ARCH_TEGRA_124_SOC=y):

|arch/arm/mach-tegra/built-in.o: In function `tegra114_cpuidle_init':
|arch/arm/mach-tegra/cpuidle-tegra114.c:93: undefined reference to `psci_smp_available'
|Makefile:927: recipe for target 'vmlinux' failed

Signed-off-by: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---

Will Deacon said:
"I just stopped moaning about not understanding it :)"

 arch/arm/include/asm/psci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/arm/include/asm/psci.h
+++ b/arch/arm/include/asm/psci.h
@@ -16,7 +16,7 @@
 
 extern struct smp_operations psci_smp_ops;
 
-#ifdef CONFIG_ARM_PSCI
+#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_SMP)
 bool psci_smp_available(void);
 #else
 static inline bool psci_smp_available(void) { return false; }
