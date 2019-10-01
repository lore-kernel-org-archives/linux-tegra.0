From: Stephen Warren <swarren@wwwdotorg.org>
Subject: PATCH 4/4] ARM: tegra: use clk_m CPU on Tegra124 LP1 resume
Date: Tue,  1 Oct 2019 15:13:46 -0600
Message-ID: <20191001211346.104400-4-swarren@wwwdotorg.org>
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191001211346.104400-1-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Configure the clock controller to set an alternate clock for the CPU when
it receives an IRQ during LP1 (system suspend). Specifically, use clk_m
(the crystal) rather than clk_s (a 32KHz clock). Such an IRQ will be the
LP1 wake event. This reduces the amount of time taken to resume from LP1.

NVIDIA's downstream kernel executes this code on both Tegra30 and
Tegra124, so it appears OK to make this change unconditionally.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 6191f9456288..ba5e9c07d1b6 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -670,8 +670,12 @@ tegra30_switch_cpu_to_clk32k:
 	pll_iddq_entry r1, r5, CLK_RESET_PLLX_MISC3, CLK_RESET_PLLX_MISC3_IDDQ
 _no_pll_in_iddq:
 
-	/* switch to CLKS */
-	mov	r0, #0	/* brust policy = 32KHz */
+	/*
+	 * Switch to clk_s (32KHz); bits 28:31=0
+	 * Enable burst on CPU IRQ; bit 24=1
+	 * Set IRQ burst clock source to clk_m; bits 10:8=0
+	 */
+	mov	r0, #(1 << 24)
 	str	r0, [r5, #CLK_RESET_SCLK_BURST]
 
 	ret	lr
-- 
2.23.0
