From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/7] soc/tegra: pmc: Add missing kerneldoc
Date: Fri, 25 Jan 2019 11:22:50 +0100
Message-ID: <20190125102255.6862-2-thierry.reding@gmail.com>
References: <20190125102255.6862-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125102255.6862-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some of the fields in struct tegra_pmc had not been documented when they
were added. Add the missing kerneldoc.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index cd865be3b195..550653302ff2 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -273,6 +273,9 @@ static const char * const tegra30_reset_sources[] = {
  * struct tegra_pmc - NVIDIA Tegra PMC
  * @dev: pointer to PMC device structure
  * @base: pointer to I/O remapped register region
+ * @wake: pointer to I/O remapped region for WAKE registers
+ * @aotag: pointer to I/O remapped region for AOTAG registers
+ * @scratch: pointer to I/O remapped region for scratch registers
  * @clk: pointer to pclk clock
  * @soc: pointer to SoC data structure
  * @debugfs: pointer to debugfs entry
@@ -291,6 +294,9 @@ static const char * const tegra30_reset_sources[] = {
  * @lp0_vec_size: size of the LP0 warm boot code
  * @powergates_available: Bitmap of available power gates
  * @powergates_lock: mutex for power gate register access
+ * @pctl_dev: pin controller exposed by the PMC
+ * @domain: IRQ domain provided by the PMC
+ * @irq: chip implementation for the IRQ domain
  */
 struct tegra_pmc {
 	struct device *dev;
-- 
2.19.1
