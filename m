From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ARM: tegra: Fix restoration of PLLM when exiting suspend
Date: Tue, 10 Dec 2019 10:37:08 +0000
Message-ID: <20191210103708.7023-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The suspend entry and exit code for 32-bit Tegra devices assumes that
the PLLM (which is used to provide the clock for external memory)
is always enabled on entry to suspend. Hence, the current code always
disables the PLLM on entry to suspend and re-enables the PLLM on exit
from suspend.

Since the introduction of the Tegra124 EMC driver by commit 73a7f0a90641
("memory: tegra: Add EMC (external memory controller) driver"), which is
used to scale the EMC frequency, PLLM may not be the current clock
source for the EMC on entry to suspend and hence may not be enabled.
Always enabling the PLLM on exit from suspend can cause the actual
status on the PLL to be different from that reported by the common clock
framework.

On kernels prior to v4.5, the code to set the rate of the PLLM had a
test to verify if the PLL was enabled and if the PLL was enabled,
setting the rate would fail. Since commit 267b62a96951
("clk: tegra: pll: Update PLLM handling") the test to see if PLLM is
enabled was removed.

With these earlier kernels, if the PLLM is disabled on entering suspend
and the EMC driver attempts to set the parent of the EMC clock to the
PLLM on exiting suspend, then the set rate for the PLLM will fail and in
turn cause the resume to fail.

We should not be re-enabling the PLLM on resume from suspend unless it
was enabled on entry to suspend. Therefore, fix this by saving the state
of PLLM on entry to suspend and only re-enable it, if it was already
enabled.

Fixes: 73a7f0a90641 ("memory: tegra: Add EMC (external memory controller) driver")
Cc: stable@vger.kernel.org

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 33 +++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 3341a12bbb9c..c2f0793a424f 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -337,26 +337,42 @@ ENTRY(tegra30_lp1_reset)
 	add	r1, r1, #2
 	wait_until r1, r7, r3
 
-	/* enable PLLM via PMC */
+	/* restore PLLM state */
 	mov32	r2, TEGRA_PMC_BASE
+	adr	r7, tegra_pllm_status
+	ldr	r1, [r7]
+	cmp	r2, #(1 << 12)
+	bne	_skip_pllm
+
 	ldr	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
 	orr	r1, r1, #(1 << 12)
 	str	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
 
 	pll_enable r1, r0, CLK_RESET_PLLM_BASE, 0
+	pll_locked r1, r0, CLK_RESET_PLLM_BASE
+
+_skip_pllm:
 	pll_enable r1, r0, CLK_RESET_PLLC_BASE, 0
 	pll_enable r1, r0, CLK_RESET_PLLX_BASE, 0
 
 	b	_pll_m_c_x_done
 
 _no_pll_iddq_exit:
-	/* enable PLLM via PMC */
+	/* restore PLLM state */
 	mov32	r2, TEGRA_PMC_BASE
+	adr	r7, tegra_pllm_status
+	ldr	r1, [r7]
+	cmp	r2, #(1 << 12)
+	bne	_skip_pllm_no_iddq
+
 	ldr	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
 	orr	r1, r1, #(1 << 12)
 	str	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
 
 	pll_enable r1, r0, CLK_RESET_PLLM_BASE, CLK_RESET_PLLM_MISC
+	pll_locked r1, r0, CLK_RESET_PLLM_BASE
+
+_skip_pllm_no_iddq:
 	pll_enable r1, r0, CLK_RESET_PLLC_BASE, CLK_RESET_PLLC_MISC
 	pll_enable r1, r0, CLK_RESET_PLLX_BASE, CLK_RESET_PLLX_MISC
 
@@ -364,7 +380,6 @@ _pll_m_c_x_done:
 	pll_enable r1, r0, CLK_RESET_PLLP_BASE, CLK_RESET_PLLP_MISC
 	pll_enable r1, r0, CLK_RESET_PLLA_BASE, CLK_RESET_PLLA_MISC
 
-	pll_locked r1, r0, CLK_RESET_PLLM_BASE
 	pll_locked r1, r0, CLK_RESET_PLLP_BASE
 	pll_locked r1, r0, CLK_RESET_PLLA_BASE
 	pll_locked r1, r0, CLK_RESET_PLLC_BASE
@@ -526,6 +541,8 @@ __no_dual_emc_chanl:
 ENDPROC(tegra30_lp1_reset)
 
 	.align	L1_CACHE_SHIFT
+tegra_pllm_status:
+	.word	0
 tegra30_sdram_pad_address:
 	.word	TEGRA_EMC_BASE + EMC_CFG				@0x0
 	.word	TEGRA_EMC_BASE + EMC_ZCAL_INTERVAL			@0x4
@@ -624,10 +641,14 @@ tegra30_switch_cpu_to_clk32k:
 	add	r1, r1, #2
 	wait_until r1, r7, r9
 
-	/* disable PLLM via PMC in LP1 */
+	/* disable PLLM, if enabled, via PMC in LP1 */
+	adr	r1, tegra_pllm_status
 	ldr	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
-	bic	r0, r0, #(1 << 12)
-	str	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
+	and	r2, r0, #(1 << 12)
+	str     r2, [r1]
+	cmp	r2, #(1 << 12)
+	biceq	r0, r0, #(1 << 12)
+	streq	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
 
 	/* disable PLLP, PLLA, PLLC and PLLX */
 	ldr	r0, [r5, #CLK_RESET_PLLP_BASE]
-- 
2.17.1
