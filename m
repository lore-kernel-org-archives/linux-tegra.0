From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/7] soc/tegra: pmc: Explicitly initialize all fields
Date: Fri, 25 Jan 2019 11:22:54 +0100
Message-ID: <20190125102255.6862-6-thierry.reding@gmail.com>
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

It's not strictly necessary to initialize the fields in struct
tegra_pmc_soc if they are 0/false. However, we already initialize them
explicitly even if unnecessary, so keep doing that for consistency.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2a2e6aaae97e..976f93628fff 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2069,6 +2069,8 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.cpu_powergates = NULL,
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
+	.needs_mbist_war = false,
+	.has_impl_33v_pwr = false,
 	.num_io_pads = 0,
 	.io_pads = NULL,
 	.num_pin_descs = 0,
@@ -2113,6 +2115,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.cpu_powergates = tegra30_cpu_powergates,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = false,
+	.needs_mbist_war = false,
 	.has_impl_33v_pwr = false,
 	.num_io_pads = 0,
 	.io_pads = NULL,
@@ -2162,6 +2165,7 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.cpu_powergates = tegra114_cpu_powergates,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = false,
+	.needs_mbist_war = false,
 	.has_impl_33v_pwr = false,
 	.num_io_pads = 0,
 	.io_pads = NULL,
@@ -2271,6 +2275,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.cpu_powergates = tegra124_cpu_powergates,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
+	.needs_mbist_war = false,
 	.has_impl_33v_pwr = false,
 	.num_io_pads = ARRAY_SIZE(tegra124_io_pads),
 	.io_pads = tegra124_io_pads,
@@ -2375,8 +2380,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.cpu_powergates = tegra210_cpu_powergates,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
-	.has_impl_33v_pwr = false,
 	.needs_mbist_war = true,
+	.has_impl_33v_pwr = false,
 	.num_io_pads = ARRAY_SIZE(tegra210_io_pads),
 	.io_pads = tegra210_io_pads,
 	.num_pin_descs = ARRAY_SIZE(tegra210_pin_descs),
@@ -2499,6 +2504,7 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.cpu_powergates = NULL,
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
+	.needs_mbist_war = false,
 	.has_impl_33v_pwr = true,
 	.num_io_pads = ARRAY_SIZE(tegra186_io_pads),
 	.io_pads = tegra186_io_pads,
@@ -2577,6 +2583,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.cpu_powergates = NULL,
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
+	.needs_mbist_war = false,
+	.has_impl_33v_pwr = false,
 	.num_io_pads = ARRAY_SIZE(tegra194_io_pads),
 	.io_pads = tegra194_io_pads,
 	.regs = &tegra186_pmc_regs,
-- 
2.19.1
