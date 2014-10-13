From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 07/14] gpu: host1x: mipi: Preserve the contents of
 MIPI_CAL_CTRL
Date: Mon, 13 Oct 2014 12:21:48 +0200
Message-ID: <1413195715-4719-7-git-send-email-thierry.reding@gmail.com>
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

By paving the CTRL reg value, the current code changes MIPI_CAL_PRESCALE
("Auto-cal calibration step prescale") from 1us to 0.1us (val=0). In the
description for PHY's noise filter (MIPI_CAL_NOISE_FLT), the TRM states
that if the value of the prescale is 0 (or 0.1us), the filter should be
set between 2-5. However, the current code sets it to 0.

For now, let's keep the prescale and filter values as-is, which is most
likely the power-on-reset values of 0x2 and 0xa, respectively.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/mipi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index a3e215a0116f..0d8c3ae8db6a 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -208,7 +208,9 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
 		tegra_mipi_writel(device->mipi, value, modules[i].reg);
 	}
 
-	tegra_mipi_writel(device->mipi, MIPI_CAL_CTRL_START, MIPI_CAL_CTRL);
+	value = tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
+	value |= MIPI_CAL_CTRL_START;
+	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
 
 	err = tegra_mipi_wait(device->mipi);
 
-- 
2.1.2
