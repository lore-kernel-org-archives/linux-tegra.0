From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 3/3] ARM: configs: Add Tegra I2S interfaces to multi_v7_defconfig
Date: Sun, 30 Jul 2017 13:22:20 +0200
Message-ID: <20170730112220.15525-3-contact@paulk.fr>
References: <20170730112220.15525-1-contact@paulk.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170730112220.15525-1-contact@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Kocialkowski <contact@paulk.fr>
List-Id: linux-tegra@vger.kernel.org

This selects both the Tegra20 and Tegra30 I2S interfaces (that were
previously auto-selected by Kconfig but are not anymore) to
multi_v7_defconfig, as modules.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 4d19c1b4b8e7..626cecdada61 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -653,6 +653,8 @@ CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_RSRC_CARD=m
 CONFIG_SND_SUN4I_CODEC=m
 CONFIG_SND_SOC_TEGRA=m
+CONFIG_SND_SOC_TEGRA20_I2S=m
+CONFIG_SND_SOC_TEGRA30_I2S=m
 CONFIG_SND_SOC_TEGRA_RT5640=m
 CONFIG_SND_SOC_TEGRA_WM8753=m
 CONFIG_SND_SOC_TEGRA_WM8903=m
-- 
2.13.3
