From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch v2] drm/tegra: fix small leak on error in tegra_fb_alloc()
Date: Tue, 12 Nov 2013 13:25:26 +0300
Message-ID: <20131112102526.GA10651@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

If we don't have enough memory for ->planes then we leak "fb".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: tiny style changes

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 490f771..f9d2de6 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -98,8 +98,10 @@ static struct tegra_fb *tegra_fb_alloc(struct drm_device *drm,
 		return ERR_PTR(-ENOMEM);
 
 	fb->planes = kzalloc(num_planes * sizeof(*planes), GFP_KERNEL);
-	if (!fb->planes)
+	if (!fb->planes) {
+		kfree(fb);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	fb->num_planes = num_planes;
