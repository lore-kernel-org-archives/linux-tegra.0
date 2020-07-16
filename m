From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/9] soc/tegra: fuse: Implement tegra_is_silicon()
Date: Thu, 16 Jul 2020 16:18:53 +0200
Message-ID: <20200716141856.544718-7-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716141856.544718-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This function can be used by drivers to determine whether code is
running on silicon or on a simulation platform.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 13 +++++++++++++
 include/soc/tegra/fuse.h               |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 89f1479b4d0e..be6b7fc169ca 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -52,6 +52,19 @@ u8 tegra_get_platform(void)
 	return (tegra_read_chipid() >> 20) & 0xf;
 }
 
+bool tegra_is_silicon(void)
+{
+	switch (tegra_get_chip_id()) {
+	case TEGRA194:
+		if (tegra_get_platform() == 0)
+			return true;
+
+		return false;
+	}
+
+	return false;
+}
+
 u32 tegra_read_straps(void)
 {
 	WARN(!chipid, "Tegra ABP MISC not yet available\n");
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 214908fc5581..a9db917a1d06 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -24,6 +24,7 @@
 u32 tegra_read_chipid(void);
 u8 tegra_get_chip_id(void);
 u8 tegra_get_platform(void);
+bool tegra_is_silicon(void);
 
 enum tegra_revision {
 	TEGRA_REVISION_UNKNOWN = 0,
-- 
2.27.0
