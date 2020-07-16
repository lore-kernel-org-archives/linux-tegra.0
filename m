From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/9] soc/tegra: fuse: Extract tegra_get_platform()
Date: Thu, 16 Jul 2020 16:18:52 +0200
Message-ID: <20200716141856.544718-6-thierry.reding@gmail.com>
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

This function extracts the PRE_SI_PLATFORM field from the HIDREV
register and can be used to determine which platform the kernel runs on
(silicon, simulation, ...). Note that while only Tegra194 and later
define this field, it should be safe to call this on prior generations
as well since this field should read as 0, indicating silicon.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    | 2 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 5 +++++
 include/soc/tegra/fuse.h               | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index d1f8dd0289e6..7e6b6ee59120 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -336,7 +336,7 @@ static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
 	 * platform type is silicon and all other non-zero values indicate
 	 * the type of simulation platform is being used.
 	 */
-	return sprintf(buf, "%d\n", (tegra_read_chipid() >> 20) & 0xf);
+	return sprintf(buf, "%d\n", tegra_get_platform());
 }
 
 static DEVICE_ATTR_RO(platform);
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 3cdd69d1bd4d..89f1479b4d0e 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -47,6 +47,11 @@ u8 tegra_get_minor_rev(void)
 	return (tegra_read_chipid() >> 16) & 0xf;
 }
 
+u8 tegra_get_platform(void)
+{
+	return (tegra_read_chipid() >> 20) & 0xf;
+}
+
 u32 tegra_read_straps(void)
 {
 	WARN(!chipid, "Tegra ABP MISC not yet available\n");
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 1097feca41ed..214908fc5581 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -23,6 +23,7 @@
 
 u32 tegra_read_chipid(void);
 u8 tegra_get_chip_id(void);
+u8 tegra_get_platform(void);
 
 enum tegra_revision {
 	TEGRA_REVISION_UNKNOWN = 0,
-- 
2.27.0
