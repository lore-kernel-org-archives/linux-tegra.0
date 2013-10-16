From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] ARM: tegra: Constify list of CPU domains
Date: Wed, 16 Oct 2013 19:19:01 +0200
Message-ID: <1381943942-30375-2-git-send-email-treding@nvidia.com>
References: <1381943942-30375-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381943942-30375-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There's no need to modify these at runtime, it is static data and never
needs to change.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index f076f0f..bd10822 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -42,8 +42,9 @@
 
 static int tegra_num_powerdomains;
 static int tegra_num_cpu_domains;
-static u8 *tegra_cpu_domains;
-static u8 tegra30_cpu_domains[] = {
+static const u8 *tegra_cpu_domains;
+
+static const u8 tegra30_cpu_domains[] = {
 	TEGRA_POWERGATE_CPU0,
 	TEGRA_POWERGATE_CPU1,
 	TEGRA_POWERGATE_CPU2,
-- 
1.8.4
