From: Terje Bergstrom <tbergstrom@nvidia.com>
Subject: [PATCHv3 6/7] ARM: tegra: Add board data and 2D clocks
Date: Thu, 13 Dec 2012 16:04:43 +0200
Message-ID: <1355407484-28904-7-git-send-email-tbergstrom@nvidia.com>
References: <1355407484-28904-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355407484-28904-1-git-send-email-tbergstrom@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: tbergstrom@nvidia.com, thierry.reding@avionic-design.de, dev@lynxeye.de, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add a driver alias gr2d for Tegra 2D device, and assign a duplicate
of 2D clock to that driver alias.

Signed-off-by: Terje Bergstrom <tbergstrom@nvidia.com>
---
 arch/arm/mach-tegra/board-dt-tegra20.c    |    1 +
 arch/arm/mach-tegra/board-dt-tegra30.c    |    1 +
 arch/arm/mach-tegra/tegra20_clocks_data.c |    2 +-
 arch/arm/mach-tegra/tegra30_clocks_data.c |    1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 734d9cc..2b7a3c2 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -95,6 +95,7 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra20-slink", 0x7000D800, "spi_tegra.2", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-slink", 0x7000DA00, "spi_tegra.3", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-host1x", 0x50000000, "host1x", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra20-gr2d", 0x54140000, "gr2d", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-dc", 0x54200000, "tegradc.0", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-dc", 0x54240000, "tegradc.1", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-hdmi", 0x54280000, "hdmi", NULL),
diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index 6497d12..6a9e6cb 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -58,6 +58,7 @@ struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra30-slink", 0x7000DC00, "spi_tegra.4", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-slink", 0x7000DE00, "spi_tegra.5", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-host1x", 0x50000000, "host1x", NULL),
+	OF_DEV_AUXDATA("nvidia,tegra30-gr2d", 0x54140000, "gr2d", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-dc", 0x54200000, "tegradc.0", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-dc", 0x54240000, "tegradc.1", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra30-hdmi", 0x54280000, "hdmi", NULL),
diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
index a23a073..15d440a 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -1041,7 +1041,7 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("usbd",	"utmip-pad",	NULL),
 	CLK_DUPLICATE("usbd",	"tegra-ehci.0",	NULL),
 	CLK_DUPLICATE("usbd",	"tegra-otg",	NULL),
-	CLK_DUPLICATE("2d",	"tegra_grhost",	"gr2d"),
+	CLK_DUPLICATE("2d",	"gr2d",	"gr2d"),
 	CLK_DUPLICATE("3d",	"tegra_grhost",	"gr3d"),
 	CLK_DUPLICATE("epp",	"tegra_grhost",	"epp"),
 	CLK_DUPLICATE("mpe",	"tegra_grhost",	"mpe"),
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index 6942c7a..5787865 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1338,6 +1338,7 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("pll_p", "tegradc.0", "parent"),
 	CLK_DUPLICATE("pll_p", "tegradc.1", "parent"),
 	CLK_DUPLICATE("pll_d2_out0", "hdmi", "parent"),
+	CLK_DUPLICATE("2d", "gr2d", "gr2d"),
 };
 
 struct clk *tegra_ptr_clks[] = {
-- 
1.7.9.5
