From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] kexec: disable non-boot CPUs
Date: Wed, 19 Dec 2012 16:44:41 -0700
Message-ID: <1355960681-32015-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Both the regular reboot and shutdown paths do this. It seems reasonable
for kexec to work the same way.

On the Tegra ARM SoC at least, this change allows kexec to work with SMP
enabled. ARM's machine_shutdown() simply puts all CPUs into a loop. If
the code of that loop is over-written, the CPUs may crash, and cause the
kexec'd kernel not to be able to initialize them. In practice, this
causes the kexec'd kernel to hang and/or crash. The intended way to
solve this is for ARM machines to provide a cpu_kill SMP operation to
e.g. power down the CPUs, or place them in reset. However, at least on
Tegra, the implementation of that function would simply be duplicating
the hotplug code that already exists, so it seems simpler to just call
disable_nonboot_cpus() for the kexec path, just like reboot/shutdown.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 kernel/kexec.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/kexec.c b/kernel/kexec.c
index 5e4bd78..6fe74d3 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -1570,6 +1570,7 @@ int kernel_kexec(void)
 #endif
 	{
 		kernel_restart_prepare(NULL);
+		disable_nonboot_cpus();
 		printk(KERN_EMERG "Starting new kernel\n");
 		machine_shutdown();
 	}
-- 
1.7.10.4
