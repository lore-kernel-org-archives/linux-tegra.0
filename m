From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 1/5] ARM: tegra: provide clock aliases for AHUB
	configlink
Date: Fri, 30 Mar 2012 17:11:33 -0600
Message-ID: <1333149097-17894-2-git-send-email-swarren@wwwdotorg.org>
References: <1333149097-17894-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1333149097-17894-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

The Tegra30 AHUB driver must call tegra_periph_reset_deassert() for all
devices on the AHUB's configlink bus. The AHUB driver must be able to
call clk_get_sys() to retrieve the clock parameter for this function.
Add the necessary clock aliases to allow this.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/mach-tegra/tegra30_clocks.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra30_clocks.c b/arch/arm/mach-tegra/tegra30_clocks.c
index 6d08b53..e33fe4b 100644
--- a/arch/arm/mach-tegra/tegra30_clocks.c
+++ b/arch/arm/mach-tegra/tegra30_clocks.c
@@ -3015,6 +3015,15 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("sbc6", "spi_slave_tegra.5", NULL),
 	CLK_DUPLICATE("twd", "smp_twd", NULL),
 	CLK_DUPLICATE("vcp", "nvavp", "vcp"),
+	CLK_DUPLICATE("i2s0", NULL, "i2s0"),
+	CLK_DUPLICATE("i2s1", NULL, "i2s1"),
+	CLK_DUPLICATE("i2s2", NULL, "i2s2"),
+	CLK_DUPLICATE("i2s3", NULL, "i2s3"),
+	CLK_DUPLICATE("i2s4", NULL, "i2s4"),
+	CLK_DUPLICATE("dam0", NULL, "dam0"),
+	CLK_DUPLICATE("dam1", NULL, "dam1"),
+	CLK_DUPLICATE("dam2", NULL, "dam2"),
+	CLK_DUPLICATE("spdif_in", NULL, "spdif_in"),
 };
 
 struct clk *tegra_ptr_clks[] = {
-- 
1.7.0.4
