From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/7] drm/nouveau: tegra: Use nvmem API
Date: Fri, 30 Aug 2019 00:19:09 +0200
Message-ID: <20190829221911.24876-6-thierry.reding@gmail.com>
References: <20190829221911.24876-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190829221911.24876-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of using the custom Tegra FUSE API to read the calibration fuse
for the clock on GM20B, use the nvmem API. This makes the dependency
between the two devices more explicit and decouples the driver from one
another.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
index b284e949f732..096a8b4b9bb5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
@@ -20,6 +20,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/nvmem-consumer.h>
+
 #include <subdev/clk.h>
 #include <subdev/volt.h>
 #include <subdev/timer.h>
@@ -929,7 +931,6 @@ gm20b_clk_new_speedo0(struct nvkm_device *device, int index,
 }
 
 /* FUSE register */
-#define FUSE_RESERVED_CALIB0	0x204
 #define FUSE_RESERVED_CALIB0_INTERCEPT_FRAC_SHIFT	0
 #define FUSE_RESERVED_CALIB0_INTERCEPT_FRAC_WIDTH	4
 #define FUSE_RESERVED_CALIB0_INTERCEPT_INT_SHIFT	4
@@ -945,14 +946,17 @@ static int
 gm20b_clk_init_fused_params(struct gm20b_clk *clk)
 {
 	struct nvkm_subdev *subdev = &clk->base.base.subdev;
+	struct nvkm_device *device = subdev->device;
 	u32 val = 0;
 	u32 rev = 0;
+	int ret;
+
+	ret = nvmem_cell_read_u32(device->dev, "calibration", &val);
+	if (ret < 0)
+		return ret;
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA)
-	tegra_fuse_readl(FUSE_RESERVED_CALIB0, &val);
 	rev = (val >> FUSE_RESERVED_CALIB0_FUSE_REV_SHIFT) &
 	      MASK(FUSE_RESERVED_CALIB0_FUSE_REV_WIDTH);
-#endif
 
 	/* No fused parameters, we will calibrate later */
 	if (rev == 0)
-- 
2.22.0
