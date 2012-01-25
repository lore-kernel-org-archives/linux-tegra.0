From: Leon Romanovsky <leon@leon.nu>
Subject: [PATCH 2/3] ARM: tegra: Enable the headphone detection
	gpio on PAZ00 board.
Date: Wed, 25 Jan 2012 20:50:20 +0200
Message-ID: <1327517420-29746-1-git-send-email-leon@leon.nu>
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
To: lrg@ti.com, broonie@opensource.wolfsonmicro.com, swarren@nvidia.com, olof@lixom.net, ccross@android.com
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Leon Romanovsky <leon@leon.nu>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Leon Romanovsky <leon@leon.nu>
---
 arch/arm/mach-tegra/board-paz00-pinmux.c |    1 +
 arch/arm/mach-tegra/board-paz00.h        |    3 +++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-paz00-pinmux.c b/arch/arm/mach-tegra/board-paz00-pinmux.c
index c775572..4e261d3 100644
--- a/arch/arm/mach-tegra/board-paz00-pinmux.c
+++ b/arch/arm/mach-tegra/board-paz00-pinmux.c
@@ -152,6 +152,7 @@ static struct tegra_gpio_table gpio_table[] = {
 	{ .gpio = TEGRA_WIFI_PWRN,	.enable = true },
 	{ .gpio = TEGRA_WIFI_RST,	.enable = true },
 	{ .gpio = TEGRA_WIFI_LED,	.enable = true },
+	{ .gpio = TEGRA_HP_DET,		.enable = true },
 };
 
 static struct tegra_board_pinmux_conf conf = {
diff --git a/arch/arm/mach-tegra/board-paz00.h b/arch/arm/mach-tegra/board-paz00.h
index ffa83f5..77c8d83 100644
--- a/arch/arm/mach-tegra/board-paz00.h
+++ b/arch/arm/mach-tegra/board-paz00.h
@@ -32,6 +32,9 @@
 #define TEGRA_WIFI_RST			TEGRA_GPIO_PD1
 #define TEGRA_WIFI_LED			TEGRA_GPIO_PD0
 
+/* Audio */
+#define TEGRA_HP_DET           TEGRA_GPIO_PW2
+
 /* WakeUp */
 #define TEGRA_GPIO_POWERKEY	TEGRA_GPIO_PJ7
 
-- 
1.7.3.4
