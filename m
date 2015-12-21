From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] clk: tegra: Fix warning caused by pll_u failing to lock
Date: Mon, 21 Dec 2015 12:56:31 +0000
Message-ID: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If the pll_u is not configured by the bootloader, then on kernel boot the
following warning is seen:

 clk_pll_wait_for_lock: Timed out waiting for pll pll_u_vco lock
 tegra_init_from_table: Failed to enable pll_u_out1
 ------------[ cut here ]------------
 WARNING: at drivers/clk/tegra/clk.c:269
 Modules linked in:

 CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.4.0-rc4-next-20151214+ #1
 Hardware name: NVIDIA Tegra210 P2371 reference board (E.1) (DT)
 task: ffffffc0bc0a0000 ti: ffffffc0bc0a8000 task.ti: ffffffc0bc0a8000
 PC is at tegra_init_from_table+0x140/0x164
 LR is at tegra_init_from_table+0x140/0x164
 pc : [<ffffffc0008fee78>] lr : [<ffffffc0008fee78>] pstate: 80000045
 sp : ffffffc0bc0abd50
 x29: ffffffc0bc0abd50 x28: ffffffc00090b8a8
 x27: ffffffc000a06000 x26: ffffffc0bc019780
 x25: ffffffc00086a708 x24: ffffffc00086a790
 x23: ffffffc0006d7188 x22: ffffffc0bc010000
 x21: 000000000000016e x20: ffffffc0bc00d100
 x19: ffffffc000944178 x18: 0000000000000007
 x17: 000000000000000e x16: 0000000000000001
 x15: 0000000000000007 x14: 000000000000000e
 x13: 0000000000000013 x12: 000000000000001a
 x11: 000000000000004d x10: 0000000000000750
 x9 : ffffffc0bc0a8000 x8 : ffffffc0bc0a07b0
 x7 : 0000000000000001 x6 : 0000000002d5f0f8
 x5 : 0000000000000000 x4 : 0000000000000000
 x3 : 0000000000000002 x2 : ffffffc000996724
 x1 : 0000000000000000 x0 : 0000000000000032

 ---[ end trace cbd20ae519e92ced ]---
 Call trace:
 [<ffffffc0008fee78>] tegra_init_from_table+0x140/0x164
 [<ffffffc000900ac8>] tegra210_clock_apply_init_table+0x20/0x28
 [<ffffffc0008fec40>] tegra_clocks_apply_init_table+0x18/0x24
 [<ffffffc00008291c>] do_one_initcall+0x90/0x194
 [<ffffffc0008cfab0>] kernel_init_freeable+0x148/0x1e8
 [<ffffffc000636bb0>] kernel_init+0x10/0xdc
 [<ffffffc000085cd0>] ret_from_fork+0x10/0x40
 clk_pll_wait_for_lock: Timed out waiting for pll pll_u_vco lock
 tegra_init_from_table: Failed to enable pll_u_out2
 ------------[ cut here ]------------

pll_u can be either controlled by software or hardware and this is
selected via the OVERRIDE bit in the pll_u base register. In the function
tegra210_pll_init(), the OVERRIDE bit for pll_u is cleared, which selects
hardware control of the pll. However, at the same time the pll_u clocks
are populated in the init_table for tegra210 and so software will try to
configure the pll_u if it is not already configured and hence, the above
warning is seen when the pll fails to lock. Remove the pll_u clocks from
the init_table so that software does not try to configure this pll on
boot.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 849be30b52bf..791215747863 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2739,8 +2739,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1 },
 	{ TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1 },
 	{ TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 672000000, 1 },
-	{ TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 1 },
-	{ TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 1 },
 	{ TEGRA210_CLK_XUSB_GATE, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_XUSB_SS_SRC, TEGRA210_CLK_PLL_U_480M, 120000000, 0 },
 	{ TEGRA210_CLK_XUSB_FS_SRC, TEGRA210_CLK_PLL_U_48M, 48000000, 0 },
-- 
2.1.4

