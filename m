From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH 2/2] clk: tegra30: Use Tegra CPU powergate helper function
Date: Mon, 3 Dec 2018 10:28:41 +0000
Message-ID: <1543832921-11661-2-git-send-email-jonathanh@nvidia.com>
References: <1543832921-11661-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543832921-11661-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Rather than using the tegra_powergate_is_powered() function for
determining if a CPU is powered, use the tegra_pmc_cpu_is_powered()
instead which was created to get the CPU power status. Internally
tegra_pmc_cpu_is_powered() calls tegra_powergate_is_powered() and so
is equivalent.

The Tegra30 clock driver is the only public user of
tegra_powergate_is_powered() and so by updating the Tegra30 clock
driver to use tegra_pmc_cpu_is_powered(), we can then make
tegra_powergate_is_powered() a non-public function.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
Resending with Thierry's ACK and CC'ing clock maintainers.

drivers/clk/tegra/clk-tegra30.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index e0aaecd98fbf..fa8d573ac626 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1148,9 +1148,9 @@ static bool tegra30_cpu_rail_off_ready(void)
 
 	cpu_rst_status = readl(clk_base +
 				TEGRA30_CLK_RST_CONTROLLER_CPU_CMPLX_STATUS);
-	cpu_pwr_status = tegra_powergate_is_powered(TEGRA_POWERGATE_CPU1) ||
-			 tegra_powergate_is_powered(TEGRA_POWERGATE_CPU2) ||
-			 tegra_powergate_is_powered(TEGRA_POWERGATE_CPU3);
+	cpu_pwr_status = tegra_pmc_cpu_is_powered(1) ||
+			 tegra_pmc_cpu_is_powered(2) ||
+			 tegra_pmc_cpu_is_powered(3);
 
 	if (((cpu_rst_status & 0xE) != 0xE) || cpu_pwr_status)
 		return false;
-- 
2.7.4
