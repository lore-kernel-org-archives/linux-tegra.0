From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/3] ASoC: tegra: fix comment indentation in ALC5632 machine
Date: Tue, 20 Mar 2012 14:55:48 -0600
Message-ID: <1332276950-9398-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fix comment indentation to clear checkpatch errors in a later patch.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
This series is for 3.5, and based on a merge of next-20120320 plus ASoC's
for-3.5 branch, plus a couple minor patches to get recent next- compiling
for Tegra, that don't affect the context of this series. Applying all the
patches to the ASoC tree should be fine; I don't anticpate any conflicts
with the likely Tegra tree for 3.5.

 sound/soc/tegra/tegra_alc5632.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index e45ccd8..03ae095 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -1,16 +1,16 @@
 /*
-* tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver
-*
-* Copyright (C) 2011 The AC100 Kernel Team <ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org>
-*
-* Authors:  Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
-*           Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
-*           Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*/
+ * tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver
+ *
+ * Copyright (C) 2011 The AC100 Kernel Team <ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org>
+ *
+ * Authors:  Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
+ *           Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
+ *           Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
 
 #include <asm/mach-types.h>
 
-- 
1.7.0.4
