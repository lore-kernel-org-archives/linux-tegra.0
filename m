From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 09/14] gpu: host1x: mipi: Set MIPI_CAL_BIAS_PAD_CFG1 register
Date: Mon, 13 Oct 2014 12:21:50 +0200
Message-ID: <1413195715-4719-9-git-send-email-thierry.reding@gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

During calibration, sets the "internal reference level for drive pull-
down" to the value specified in the Tegra TRM.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/mipi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 22e20c2399c5..fbc6ee6ca337 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -72,6 +72,7 @@
 #define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
 
 #define MIPI_CAL_BIAS_PAD_CFG1		0x17
+#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
 
 #define MIPI_CAL_BIAS_PAD_CFG2		0x18
 #define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
@@ -203,6 +204,9 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 	value |= MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
 
+	tegra_mipi_writel(device->mipi, MIPI_CAL_BIAS_PAD_DRV_DN_REF(2),
+			  MIPI_CAL_BIAS_PAD_CFG1);
+
 	value = tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
 	value &= ~MIPI_CAL_BIAS_PAD_PDVREG;
 	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
-- 
2.1.2
