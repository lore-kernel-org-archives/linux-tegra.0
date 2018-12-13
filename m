From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 08/21] clk: tegra: dfll: round down voltages based on
 alignment
Date: Thu, 13 Dec 2018 17:34:25 +0800
Message-ID: <20181213093438.29621-9-josephl@nvidia.com>
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

When generating the OPP table, the voltages are round down with the
alignment from the regulator. The alignment should be applied for
voltages look up as well.

Based on the work of Penny Chiu <pchiu@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
*V2:
 - s/align_volt/align_step/
 - s/reg_volt/reg_volt_id/
---
 drivers/clk/tegra/clk-dfll.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 72e02898006c..b3668073d9b4 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -804,17 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll *td)
 static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
 {
 	struct dev_pm_opp *opp;
-	int i, uv;
+	int i, align_step;
 
 	opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
 	if (IS_ERR(opp))
 		return PTR_ERR(opp);
 
-	uv = dev_pm_opp_get_voltage(opp);
+	align_step = dev_pm_opp_get_voltage(opp) / td->soc->alignment.step_uv;
 	dev_pm_opp_put(opp);
 
 	for (i = td->lut_bottom; i < td->lut_size; i++) {
-		if (td->lut_uv[i] >= uv)
+		if ((td->lut_uv[i] / td->soc->alignment.step_uv) >= align_step)
 			return i;
 	}
 
@@ -1532,15 +1532,17 @@ static int dfll_init(struct tegra_dfll *td)
  */
 static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
 {
-	int i, n_voltages, reg_uV;
+	int i, n_voltages, reg_volt_id, align_step;
 
+	align_step = uV / td->soc->alignment.step_uv;
 	n_voltages = regulator_count_voltages(td->vdd_reg);
 	for (i = 0; i < n_voltages; i++) {
-		reg_uV = regulator_list_voltage(td->vdd_reg, i);
-		if (reg_uV < 0)
+		reg_volt_id = regulator_list_voltage(td->vdd_reg, i) /
+			      td->soc->alignment.step_uv;
+		if (reg_volt_id < 0)
 			break;
 
-		if (uV == reg_uV)
+		if (align_step == reg_volt_id)
 			return i;
 	}
 
@@ -1554,15 +1556,17 @@ static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
  * */
 static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
 {
-	int i, n_voltages, reg_uV;
+	int i, n_voltages, reg_volt_id, align_step;
 
+	align_step = uV / td->soc->alignment.step_uv;
 	n_voltages = regulator_count_voltages(td->vdd_reg);
 	for (i = 0; i < n_voltages; i++) {
-		reg_uV = regulator_list_voltage(td->vdd_reg, i);
-		if (reg_uV < 0)
+		reg_volt_id = regulator_list_voltage(td->vdd_reg, i) /
+			      td->soc->alignment.step_uv;
+		if (reg_volt_id < 0)
 			break;
 
-		if (uV <= reg_uV)
+		if (align_step <= reg_volt_id)
 			return i;
 	}
 
-- 
2.19.2
