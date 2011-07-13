From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: Tegra: Trimslice: Tri-state DAP2 pinmux
Date: Wed, 13 Jul 2011 11:44:51 -0600
Message-ID: <1310579091-7424-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

DAP2 is used for a bunch of GPIOs. Not tri-stating the pins means audio
signals get sent out there, and this ends up resetting USB and breaking
SDHCI too.

In the long run, the kernel should correctly configure all the relevant
GPIO pins using tegra_gpio_enable, set each pin as an output, and set each
pin's value. Such a change requires full schematic access, which I don't
have. Hence, this change is good enough as a quick fix. 

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Mike, recall that when I previously tested your TrimSlice patches, I found
a problem where playing audio would cause the USB bus to get reset. I recall
having solved it with a pinmux change, and I believe this patch is that
change. Could you check if it's still necessary and whether this change
works? Thanks.

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
