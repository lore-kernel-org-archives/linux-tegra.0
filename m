From: Rikard Falkeborn <rikard.falkeborn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] memory: tegra: Constify struct thermal_cooling_device_ops
Date: Wed, 10 Jun 2020 00:12:35 +0200
Message-ID: <20200609221235.44602-1-rikard.falkeborn@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rikard Falkeborn <rikard.falkeborn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra210_emc_cd_ops is never modified and can be made const to allow the
compiler to put it in read-only memory.

Before:
   text    data     bss     dec     hex filename
  27936    5600     192   33728    83c0 drivers/memory/tegra/tegra210-emc-core.o

After:
   text    data     bss     dec     hex filename
  28040    5504     192   33736    83c8 drivers/memory/tegra/tegra210-emc-core.o

Signed-off-by: Rikard Falkeborn <rikard.falkeborn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/memory/tegra/tegra210-emc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index cdd663ba4733..2dfcc0e2e15d 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -711,7 +711,7 @@ static int tegra210_emc_cd_set_state(struct thermal_cooling_device *cd,
 	return 0;
 }
 
-static struct thermal_cooling_device_ops tegra210_emc_cd_ops = {
+static const struct thermal_cooling_device_ops tegra210_emc_cd_ops = {
 	.get_max_state = tegra210_emc_cd_max_state,
 	.get_cur_state = tegra210_emc_cd_get_state,
 	.set_cur_state = tegra210_emc_cd_set_state,
-- 
2.27.0
