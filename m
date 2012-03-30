From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/5] ARM: tegra: add AUXDATA required for audio
Date: Fri, 30 Mar 2012 17:11:35 -0600
Message-ID: <1333149097-17894-4-git-send-email-swarren@wwwdotorg.org>
References: <1333149097-17894-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333149097-17894-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Both the Tegra30 I2S and AHUB modules used clocks, and hence currently
require AUXDATA in order to get specific device names so that clock
lookups work.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra30.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index 3de21c0..f06b1c4 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -51,6 +51,12 @@ struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000C500, "tegra-i2c.2", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000C700, "tegra-i2c.3", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-i2c", 0x7000D000, "tegra-i2c.4", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-i2s", 0x70080300, "tegra30-i2s.0", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-i2s", 0x70080400, "tegra30-i2s.1", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-i2s", 0x70080500, "tegra30-i2s.2", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-i2s", 0x70080600, "tegra30-i2s.3", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-i2s", 0x70080700, "tegra30-i2s.4", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-ahub", 0x70080000, "tegra30-ahub", NULL),
 	{}
 };
 
-- 
1.7.0.4
