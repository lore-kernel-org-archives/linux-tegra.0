From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: Tegra: Trimslice: Tri-state DAP3 pinmux
Date: Wed, 13 Jul 2011 16:42:47 -0600
Message-ID: <1310596967-19996-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

DAP3 is used for a bunch of GPIOs. Not tri-stating the pins means audio
signals get sent out there, and this ends up resetting USB and breaking
SDHCI too.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: s/DAP2/DAP3/ in patch subject/description.

I've not verified that this patch is both necessary and sufficient on
TrimSlice hardware.

 arch/arm/mach-tegra/board-trimslice-pinmux.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-trimslice-pinmux.c b/arch/arm/mach-tegra/board-trimslice-pinmux.c
index 82646a4..47c596c 100644
--- a/arch/arm/mach-tegra/board-trimslice-pinmux.c
+++ b/arch/arm/mach-tegra/board-trimslice-pinmux.c
@@ -35,7 +35,7 @@ static __initdata struct tegra_pingroup_config trimslice_pinmux[] = {
 	{TEGRA_PINGROUP_CSUS,  TEGRA_MUX_VI_SENSOR_CLK, TEGRA_PUPD_PULL_DOWN,   TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_DAP1,  TEGRA_MUX_DAP1,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
 	{TEGRA_PINGROUP_DAP2,  TEGRA_MUX_DAP2,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
-	{TEGRA_PINGROUP_DAP3,  TEGRA_MUX_DAP3,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
+	{TEGRA_PINGROUP_DAP3,  TEGRA_MUX_DAP3,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_DAP4,  TEGRA_MUX_DAP4,          TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_DDC,   TEGRA_MUX_I2C2,          TEGRA_PUPD_PULL_UP,     TEGRA_TRI_NORMAL},
 	{TEGRA_PINGROUP_DTA,   TEGRA_MUX_VI,            TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
-- 
1.7.0.4
