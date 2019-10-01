From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 3/4] ARM: tegra: modify reshift divider during LP1
Date: Tue,  1 Oct 2019 15:13:45 -0600
Message-ID: <20191001211346.104400-3-swarren@wwwdotorg.org>
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

The reshift hardware module implements the RAM re-repair process. This
module uses PLLP as an input clock during LP1 resume. The input divider
for this clock is typically set for PLLP's normal rate. During LP1
resume, PLLP is bypassed and so runs at the crystal rate, which is much
slower. Consequently, decrease the divider so that the reshift module
runs at a reasonable rate during LP1 resume.

NVIDIA's downstream kernel code only does this if not compiled for
Tegra30, so the added code is made conditional upon the chip ID.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 6922dd8d3e2d..6191f9456288 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -59,6 +59,9 @@
 #define CLK_RESET_PLLX_MISC3_IDDQ	3
 #define CLK_RESET_PLLM_MISC_IDDQ	5
 #define CLK_RESET_PLLC_MISC_IDDQ	26
+#define CLK_RESET_PLLP_RESHIFT		0x528
+#define CLK_RESET_PLLP_RESHIFT_DEFAULT	0x3b
+#define CLK_RESET_PLLP_RESHIFT_ENABLE	0x3
 
 #define CLK_RESET_CLK_SOURCE_MSELECT	0x3b4
 
@@ -373,9 +376,13 @@ _pll_m_c_x_done:
 	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
 	cmp	r1, #TEGRA30
 	beq	1f
+
 	ldr	r1, [r0, #CLK_RESET_PLLP_BASE]
 	bic	r1, r1, #(1<<31)	@ disable PllP bypass
 	str	r1, [r0, #CLK_RESET_PLLP_BASE]
+
+	mov	r1, #CLK_RESET_PLLP_RESHIFT_DEFAULT
+	str	r1, [r0, #CLK_RESET_PLLP_RESHIFT]
 1:
 
 	mov32	r7, TEGRA_TMRUS_BASE
@@ -644,6 +651,10 @@ tegra30_switch_cpu_to_clk32k:
 	orrne	r0, r0, #(1 << 31)	@ enable PllP bypass on fast cluster
 	bic	r0, r0, #(1 << 30)
 	str	r0, [r5, #CLK_RESET_PLLP_BASE]
+	beq	1f
+	mov	r0, #CLK_RESET_PLLP_RESHIFT_ENABLE
+	str	r0, [r5, #CLK_RESET_PLLP_RESHIFT]
+1:
 	ldr	r0, [r5, #CLK_RESET_PLLA_BASE]
 	bic	r0, r0, #(1 << 30)
 	str	r0, [r5, #CLK_RESET_PLLA_BASE]
-- 
2.23.0
