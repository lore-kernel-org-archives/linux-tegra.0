From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: trusted_foundations: Maintain CPU endianness
Date: Fri, 20 Mar 2015 18:36:44 +0300
Message-ID: <1426865807-22981-1-git-send-email-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Convert CPU reset vector address to LE to support big-endian kernel.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/firmware/trusted_foundations.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/firmware/trusted_foundations.c b/arch/arm/firmware/trusted_foundations.c
index 3fb1b5a..865103a 100644
--- a/arch/arm/firmware/trusted_foundations.c
+++ b/arch/arm/firmware/trusted_foundations.c
@@ -50,7 +50,7 @@ static void __naked tf_generic_smc(u32 type, u32 arg1, u32 arg2)
 
 static int tf_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
 {
-	cpu_boot_addr = boot_addr;
+	cpu_boot_addr = cpu_to_le32(boot_addr);
 	tf_generic_smc(TF_SET_CPU_BOOT_ADDR_SMC, cpu_boot_addr, 0);
 
 	return 0;
-- 
2.3.3
