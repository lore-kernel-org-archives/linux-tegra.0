From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 03/14] ARM: tegra: pinmux: use IO_ADDRESS
Date: Thu,  6 Oct 2011 19:54:13 -0700
Message-ID: <1317956064-17650-4-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317956064-17650-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fixes lots of:

arch/arm/mach-tegra/pinmux.c:175:9: warning: incorrect type in argument 1 (different base types)
arch/arm/mach-tegra/pinmux.c:175:9:    expected void const volatile [noderef] <asn:2>*<noident>
arch/arm/mach-tegra/pinmux.c:175:9:    got unsigned lon

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/pinmux-t2-tables.c |    4 ++--
 arch/arm/mach-tegra/pinmux.c           |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/pinmux-t2-tables.c b/arch/arm/mach-tegra/pinmux-t2-tables.c
index a475367..94e2417 100644
--- a/arch/arm/mach-tegra/pinmux-t2-tables.c
+++ b/arch/arm/mach-tegra/pinmux-t2-tables.c
@@ -232,12 +232,12 @@ static u32 pinmux_reg[TRISTATE_REG_NUM + PIN_MUX_CTL_REG_NUM +
 
 static inline unsigned long pg_readl(unsigned long offset)
 {
-	return readl(IO_TO_VIRT(TEGRA_APB_MISC_BASE + offset));
+	return readl(IO_ADDRESS(TEGRA_APB_MISC_BASE + offset));
 }
 
 static inline void pg_writel(unsigned long value, unsigned long offset)
 {
-	writel(value, IO_TO_VIRT(TEGRA_APB_MISC_BASE + offset));
+	writel(value, IO_ADDRESS(TEGRA_APB_MISC_BASE + offset));
 }
 
 void tegra_pinmux_suspend(void)
diff --git a/arch/arm/mach-tegra/pinmux.c b/arch/arm/mach-tegra/pinmux.c
index f80d507..0a85e0e 100644
--- a/arch/arm/mach-tegra/pinmux.c
+++ b/arch/arm/mach-tegra/pinmux.c
@@ -172,12 +172,12 @@ static const char *pupd_name(unsigned long val)
 
 static inline unsigned long pg_readl(unsigned long offset)
 {
-	return readl(IO_TO_VIRT(TEGRA_APB_MISC_BASE + offset));
+	return readl(IO_ADDRESS(TEGRA_APB_MISC_BASE + offset));
 }
 
 static inline void pg_writel(unsigned long value, unsigned long offset)
 {
-	writel(value, IO_TO_VIRT(TEGRA_APB_MISC_BASE + offset));
+	writel(value, IO_ADDRESS(TEGRA_APB_MISC_BASE + offset));
 }
 
 static int tegra_pinmux_set_func(const struct tegra_pingroup_config *config)
-- 
1.7.4.1
