From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 12/15] clk: tegra: dfll: improve function-level documentation
Date: Sat,  1 Oct 2016 21:46:29 +0200
Message-ID: <1475351192-27079-13-git-send-email-Julia.Lawall@lip6.fr>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Adjust variables to correspond to the names used in the parameter list of
the function.  Move the struct device * variable up to the place where it
appears in the parameter list.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/tegra/cvb.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/cvb.c b/drivers/clk/tegra/cvb.c
index 624115e..da9e8e7 100644
--- a/drivers/clk/tegra/cvb.c
+++ b/drivers/clk/tegra/cvb.c
@@ -92,19 +92,19 @@ static int build_opp_table(struct device *dev, const struct cvb_table *table,
 
 /**
  * tegra_cvb_add_opp_table - build OPP table from Tegra CVB tables
- * @cvb_tables: array of CVB tables
- * @sz: size of the previously mentioned array
+ * @dev: the struct device * for which the OPP table is built
+ * @tables: array of CVB tables
+ * @count: size of the previously mentioned array
  * @process_id: process id of the HW module
  * @speedo_id: speedo id of the HW module
  * @speedo_value: speedo value of the HW module
- * @max_rate: highest safe clock rate
- * @opp_dev: the struct device * for which the OPP table is built
+ * @max_freq: highest safe clock rate
  *
  * On Tegra, a CVB table encodes the relationship between operating voltage
  * and safe maximal frequency for a given module (e.g. GPU or CPU). This
  * function calculates the optimal voltage-frequency operating points
  * for the given arguments and exports them via the OPP library for the
- * given @opp_dev. Returns a pointer to the struct cvb_table that matched
+ * given @dev. Returns a pointer to the struct cvb_table that matched
  * or an ERR_PTR on failure.
  */
 const struct cvb_table *

