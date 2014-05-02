From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 1/9] drm/nouveau/bar: only ioremap BAR3 if it exists
Date: Fri, 2 May 2014 18:32:34 +0900
Message-ID: <1399023162-13159-2-git-send-email-acourbot@nvidia.com>
References: <1399023162-13159-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1399023162-13159-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: gnurou@gmail.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Some chips that use system memory exclusively (e.g. GK20A) do not
expose 2 BAR regions. For them only BAR1 exists, and it should be used
for USERD mapping. Do not map BAR3 if its resource does not exist.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/core/subdev/bar/base.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/base.c b/drivers/gpu/drm/nouveau/core/subdev/bar/base.c
index bdf594116f3f..73b1ed20c8d5 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bar/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bar/base.c
@@ -118,8 +118,10 @@ nouveau_bar_create_(struct nouveau_object *parent,
 	if (ret)
 		return ret;
 
-	bar->iomem = ioremap(nv_device_resource_start(device, 3),
-			     nv_device_resource_len(device, 3));
+	if (nv_device_resource_len(device, 3) != 0)
+		bar->iomem = ioremap(nv_device_resource_start(device, 3),
+				     nv_device_resource_len(device, 3));
+
 	return 0;
 }
 
-- 
1.9.2
