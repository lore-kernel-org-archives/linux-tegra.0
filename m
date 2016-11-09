From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/4] soc/tegra: pmc: Remove legacy Tegra I/O rail API
Date: Wed, 9 Nov 2016 18:39:19 +0530
Message-ID: <1478696962-11831-2-git-send-email-ldewangan@nvidia.com>
References: <1478696962-11831-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478696962-11831-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Remove tegra_io_rail_power_on() and tegra_io_rail_power_off()
from header as client has been moved to new APIs.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes from V1:
 None
---
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
