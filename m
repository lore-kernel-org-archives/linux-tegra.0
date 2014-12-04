From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] drm/tegra: checking IS_ERR() instead of NULL
Date: Thu, 4 Dec 2014 14:00:35 +0300
Message-ID: <20141204110035.GC22643@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

iommu_domain_alloc() returns NULL on error, it never returns error
pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e549afe..fa16048 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -36,8 +36,8 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
 
 	if (iommu_present(&platform_bus_type)) {
 		tegra->domain = iommu_domain_alloc(&platform_bus_type);
-		if (IS_ERR(tegra->domain)) {
-			err = PTR_ERR(tegra->domain);
+		if (!tegra->domain) {
+			err = -ENOMEM;
 			goto free;
 		}
 
