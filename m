From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/9] soc/tegra: fuse: Add Tegra186 and Tegra194 SoC IDs
Date: Thu, 16 Jul 2020 16:18:51 +0200
Message-ID: <20200716141856.544718-5-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716141856.544718-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Sandipan Patra <spatra-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

SoC IDs for these generations had never been defined. Do so now.

Signed-off-by: Sandipan Patra <spatra-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/soc/tegra/fuse.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 252ea20fe4c1..1097feca41ed 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -12,6 +12,8 @@
 #define TEGRA124	0x40
 #define TEGRA132	0x13
 #define TEGRA210	0x21
+#define TEGRA186	0x18
+#define TEGRA194	0x19
 
 #define TEGRA_FUSE_SKU_CALIB_0	0xf0
 #define TEGRA30_FUSE_SATA_CALIB	0x124
-- 
2.27.0
