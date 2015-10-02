From: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Subject: [PATCH] arm: make psci_smp_available() depend on SMP + PSCI as the makefile does
Date: Fri,  2 Oct 2015 23:13:24 +0200
Message-ID: <1443820404-16431-1-git-send-email-sebastian@breakpoint.cc>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>

with CONFIG_ARM_PSCI=y, CONFIG_SMP=n and CONFIG_ARCH_TEGRA_124_SOC=y I
end up with:

|arch/arm/mach-tegra/built-in.o: In function `tegra114_cpuidle_init':
|arch/arm/mach-tegra/cpuidle-tegra114.c:93: undefined reference to `psci_smp_available'
|Makefile:927: recipe for target 'vmlinux' failed

during build testing.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 arch/arm/include/asm/psci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/psci.h b/arch/arm/include/asm/psci.h
index 68ee3ce17b82..ff956f4d4307 100644
--- a/arch/arm/include/asm/psci.h
+++ b/arch/arm/include/asm/psci.h
@@ -16,7 +16,7 @@
 
 extern struct smp_operations psci_smp_ops;
 
-#ifdef CONFIG_ARM_PSCI
+#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_SMP)
 bool psci_smp_available(void);
 #else
 static inline bool psci_smp_available(void) { return false; }
-- 
2.6.0
