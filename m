From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] soc/tegra: pmc: Remove legacy Tegra I/O rail API
Date: Wed, 2 Nov 2016 14:29:47 +0530
Message-ID: <1478077189-24426-2-git-send-email-ldewangan@nvidia.com>
References: <1478077189-24426-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478077189-24426-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Remove tegra_io_rail_power_on() and tegra_io_rail_power_off()
from header as client has been moved to new APIs.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Based on the branch
	(https://github.com/thierryreding/linux/tree/tegra186).
This is just residual of earlier applied patch
commit 7cf94b5869b99c1fc0da8699542c8f3644537c33
Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
    soc/tegra: pmc: Remove legacy Tegra I/O rail API

Possibly it can be squashed on the change.


 include/soc/tegra/pmc.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 52780a77..9c314a6 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -203,16 +203,6 @@ static inline int tegra_io_pad_get_voltage(enum tegra_io_pad id)
 {
 	return -ENOSYS;
 }
-
-static inline int tegra_io_rail_power_on(unsigned int id)
-{
-	return -ENOSYS;
-}
-
-static inline int tegra_io_rail_power_off(unsigned int id)
-{
-	return -ENOSYS;
-}
 #endif /* CONFIG_ARCH_TEGRA */
 
 #endif /* __SOC_TEGRA_PMC_H__ */
-- 
2.1.4
