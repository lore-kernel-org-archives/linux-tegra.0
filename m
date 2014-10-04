From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v3 3/3] ARM: tegra: enable sgtl5000 audio
Date: Sat,  4 Oct 2014 02:15:45 +0200
Message-ID: <6bd1e5a958108f4d834015342be6de094dbbeb68.1412381377.git.marcel@ziswiler.com>
References: <cover.1412381377.git.marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1412381377.git.marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, stefan@agner.ch, Marcel Ziswiler <marcel@ziswiler.com>, Fabio Estevam <festevam@gmail.com>
List-Id: linux-tegra@vger.kernel.org

The NVIDIA Tegra 3 based Apalis T30 and Colibri T30 modules contain a Freescale SGTL5000 analogue audio codec.

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
Reviewed-by: Stephen Warren <swarren@nvidia.com>
---
Changes in v3:
- Revert to not using simple-audio-card being incompatible with tegra.
- Rebased to for-next.

Changes in v2:
- Using simple-audio-card as suggested by Fabio.

 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 77d6e94..02233d1 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -210,6 +210,7 @@ CONFIG_SND_SOC_TEGRA_WM8903=y
 CONFIG_SND_SOC_TEGRA_TRIMSLICE=y
 CONFIG_SND_SOC_TEGRA_ALC5632=y
 CONFIG_SND_SOC_TEGRA_MAX98090=y
+CONFIG_SND_SOC_TEGRA_SGTL5000=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_EHCI_HCD=y
-- 
1.9.3
