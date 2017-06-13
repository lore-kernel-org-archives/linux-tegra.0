From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 17/22] gpu: host1x: Correct swapped arguments in the is_addr_reg() definition
Date: Wed, 14 Jun 2017 02:15:56 +0300
Message-ID: <d657ec69048052262446544328add1e6d6ae6fcd.1497394243.git.digetx@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Arguments of the .is_addr_reg() are swapped in the definition of the
function, that is quite confusing.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/host1x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 71a34774b56a..561d6bb6580d 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -233,7 +233,7 @@ struct host1x_job {
 	u8 *gather_copy_mapped;
 
 	/* Check if register is marked as an address reg */
-	int (*is_addr_reg)(struct device *dev, u32 reg, u32 class);
+	int (*is_addr_reg)(struct device *dev, u32 class, u32 reg);
 
 	/* Check if class belongs to the unit */
 	int (*is_valid_class)(u32 class);
-- 
2.13.0
