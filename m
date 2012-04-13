From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2 REBASE 1/4] ASoC: tegra: select REGMAP_MMIO
Date: Fri, 13 Apr 2012 12:14:05 -0600
Message-ID: <1334340848-30784-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

All Tegra ASoC drivers will be reworked to use MMIO regmaps. Select
this in Kconfig.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v2: Split into separate patch
---
 sound/soc/tegra/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 441c317..5331c61 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -1,6 +1,7 @@
 config SND_SOC_TEGRA
 	tristate "SoC Audio for the Tegra System-on-Chip"
 	depends on ARCH_TEGRA && TEGRA_SYSTEM_DMA
+	select REGMAP_MMIO
 	help
 	  Say Y or M here if you want support for SoC audio on Tegra.
 
-- 
1.7.0.4
