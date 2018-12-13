From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 09/21] clk: tegra: dfll: add protection for find_vdd_map
 APIs
Date: Thu, 13 Dec 2018 17:34:26 +0800
Message-ID: <20181213093438.29621-10-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The DFLL hardware supports both I2C and PWM based regulator. SW driver
only touches I2C regulator when generating LUT. And shouldn't touch it
anymore once the DFLL is enabled.

This patch adds the protection for the APIs that only work with I2C mode
to avoid they could be called accidentally.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
*V2:
 - new added patch in V2
---
 drivers/clk/tegra/clk-dfll.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index b3668073d9b4..93cc86f17f7b 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1534,6 +1534,9 @@ static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
 {
 	int i, n_voltages, reg_volt_id, align_step;
 
+	if (WARN_ON(td->pmu_if == TEGRA_DFLL_PMU_PWM))
+		return -EINVAL;
+
 	align_step = uV / td->soc->alignment.step_uv;
 	n_voltages = regulator_count_voltages(td->vdd_reg);
 	for (i = 0; i < n_voltages; i++) {
@@ -1558,6 +1561,9 @@ static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
 {
 	int i, n_voltages, reg_volt_id, align_step;
 
+	if (WARN_ON(td->pmu_if == TEGRA_DFLL_PMU_PWM))
+		return -EINVAL;
+
 	align_step = uV / td->soc->alignment.step_uv;
 	n_voltages = regulator_count_voltages(td->vdd_reg);
 	for (i = 0; i < n_voltages; i++) {
-- 
2.19.2
