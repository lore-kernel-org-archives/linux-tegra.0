From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH v6 2/7] soc/tegra: pmc: Factor out DPD register bit calculation
Date: Mon, 30 Jul 2018 17:01:34 +0300
Message-ID: <1532959299-17089-3-git-send-email-avienamo@nvidia.com>
References: <1532959299-17089-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532959299-17089-1-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: Aapo Vienamo <avienamo@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Factor out the the code to calculate the correct DPD register and bit
number for a given pad. This logic will be needed to query the status
register.

Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f926332..393ca72 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -922,11 +922,12 @@ tegra_io_pad_find(struct tegra_pmc *pmc, enum tegra_io_pad id)
 	return NULL;
 }
 
-static int tegra_io_pad_prepare(enum tegra_io_pad id, unsigned long *request,
-				unsigned long *status, u32 *mask)
+static int tegra_io_pad_get_dpd_register_bit(enum tegra_io_pad id,
+					     unsigned long *request,
+					     unsigned long *status,
+					     u32 *mask)
 {
 	const struct tegra_io_pad_soc *pad;
-	unsigned long rate, value;
 
 	pad = tegra_io_pad_find(pmc, id);
 	if (!pad) {
@@ -947,6 +948,19 @@ static int tegra_io_pad_prepare(enum tegra_io_pad id, unsigned long *request,
 		*request = pmc->soc->regs->dpd2_req;
 	}
 
+	return 0;
+}
+
+static int tegra_io_pad_prepare(enum tegra_io_pad id, unsigned long *request,
+				unsigned long *status, u32 *mask)
+{
+	unsigned long rate, value;
+	int err;
+
+	err = tegra_io_pad_get_dpd_register_bit(id, request, status, mask);
+	if (err)
+		return err;
+
 	if (pmc->clk) {
 		rate = clk_get_rate(pmc->clk);
 		if (!rate) {
-- 
2.7.4
