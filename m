From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Fix some whitespace oddities
Date: Fri,  6 Dec 2013 16:27:12 +0100
Message-ID: <1386343633-2137-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some of the powergate code uses unusual spacing around == and has a tab
instead of a space before an opening parenthesis.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index 3bddf9684efd..2c175c67e39f 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -147,9 +147,9 @@ int tegra_powergate_remove_clamping(int id)
 	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
 	 * swapped relatively to the partition ids
 	 */
-	if (id ==  TEGRA_POWERGATE_VDEC)
+	if (id == TEGRA_POWERGATE_VDEC)
 		mask = (1 << TEGRA_POWERGATE_PCIE);
-	else if	(id == TEGRA_POWERGATE_PCIE)
+	else if (id == TEGRA_POWERGATE_PCIE)
 		mask = (1 << TEGRA_POWERGATE_VDEC);
 	else
 		mask = (1 << id);
-- 
1.8.4.2
