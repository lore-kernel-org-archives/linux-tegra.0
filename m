From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 22/22] Revert "iommu/tegra: gart: Do not register with bus"
Date: Tue, 23 May 2017 03:16:33 +0300
Message-ID: <781477cf9ac61301e639f71236d65a8b31586827.1495498184.git.digetx@gmail.com>
References: <fb3b357fbbdf61a20609f38a817c3f45ebc238fc.1495498184.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fb3b357fbbdf61a20609f38a817c3f45ebc238fc.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The GART driver was disabled because it was picked by as an IOMMU provider
for the DRM driver on Tegra20, which is not the purpose of the GART. Now
DRM driver avoids to use IOMMU on Tegra20, so the GART driver can be
re-enabled. Potentially there are interesting use cases of the GART for
Tegra20, like mmap'ing of a fallback memory allocation and using its GART
aperture for an accelerated graphics operation.

This reverts commit c7e3ca515e784a82223f447b79eb2090bdb91378.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iommu/tegra-gart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 37e708fdbb5a..430d13bf4f95 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -422,7 +422,7 @@ static int tegra_gart_probe(struct platform_device *pdev)
 	do_gart_setup(gart, NULL);
 
 	gart_handle = gart;
-
+	bus_set_iommu(&platform_bus_type, &gart_iommu_ops);
 	return 0;
 }
 
-- 
2.13.0
