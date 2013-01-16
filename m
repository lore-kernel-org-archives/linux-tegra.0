From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Subject: [RFC PATCH 1/5] arm: tegra: Fix build under Android cross-compiler
Date: Wed, 16 Jan 2013 14:56:09 -0500
Message-ID: <1358366173-56861-2-git-send-email-jeremya@cs.columbia.edu>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358366173-56861-1-git-send-email-jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

This patch explicitly enables ARM security extensions in sleep.S.
This fixes kernel builds with Android provided ARM cross-compilers
which do not assume the presence of the security extensions.

Signed-off-by: Jeremy C. Andrus <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>

Change-Id: Id079d54ad0cecf9145b9d51aaeebf4e6a22e80a2
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/sleep.S | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-tegra/sleep.S b/arch/arm/mach-tegra/sleep.S
index 18b8799..4e898b8 100644
--- a/arch/arm/mach-tegra/sleep.S
+++ b/arch/arm/mach-tegra/sleep.S
@@ -50,6 +50,15 @@
 #define TEGRA_CLK_RESET_VIRT	(TEGRA_CLK_RESET_BASE - IO_PPSB_PHYS + IO_PPSB_VIRT)
 
 /*
+ * ARM security extensions are required when compiling TRUSTED_FOUNDATIONS code,
+ * and this explicit arch_extension line fixes the build on compilers where the
+ * as-instr Makefile function fails. The Android cross-compiler is an example.
+ */
+#ifdef CONFIG_TRUSTED_FOUNDATIONS
+.arch_extension sec
+#endif
+
+/*
  * tegra_pen_lock
  *
  * spinlock implementation with no atomic test-and-set and no coherence
-- 
1.8.1
