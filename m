From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 09/22] drm/tegra: Don't use IOMMU on Tegra20
Date: Wed, 14 Jun 2017 02:15:48 +0300
Message-ID: <d707bd34e268f9d8fb29bf510a9f17e5f943a635.1497394243.git.digetx@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There is no IOMMU on Tegra20, instead a GART would be picked as an IOMMU
provider.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 3 ++-
 drivers/gpu/host1x/dev.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e999391aedc9..aa7988dcc28f 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -131,7 +131,8 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 	if (!tegra)
 		return -ENOMEM;
 
-	if (iommu_present(&platform_bus_type)) {
+	if (iommu_present(&platform_bus_type) &&
+	    !of_machine_is_compatible("nvidia,tegra20")) {
 		u64 carveout_start, carveout_end, gem_start, gem_end;
 		struct iommu_domain_geometry *geometry;
 		unsigned long order;
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index f05ebb14fa63..6a805ed908c3 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -177,7 +177,8 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	if (iommu_present(&platform_bus_type)) {
+	if (iommu_present(&platform_bus_type) &&
+	    !of_machine_is_compatible("nvidia,tegra20")) {
 		struct iommu_domain_geometry *geometry;
 		unsigned long order;
 
-- 
2.13.0
