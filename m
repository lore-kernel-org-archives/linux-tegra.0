From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 2/3] ARM: configs: Add Tegra I2S interfaces to
	tegra_defconfig
Date: Sun, 30 Jul 2017 13:22:19 +0200
Message-ID: <20170730112220.15525-2-contact@paulk.fr>
References: <20170730112220.15525-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20170730112220.15525-1-contact@paulk.fr>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
Cc: Stephen Warren <swarren@nvidia.com>, Paul Kocialkowski <contact@paulk.fr>, Takashi Iwai <tiwai@suse.com>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This selects both the Tegra20 and Tegra30 I2S interfaces (that were
previously auto-selected by Kconfig but are not anymore) to
tegra_defconfig, as built-ins.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/configs/tegra_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index f0efc854b5a2..fe1275aa067e 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -202,6 +202,8 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
+CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
 CONFIG_SND_SOC_TEGRA_WM8903=y
-- 
2.13.3
