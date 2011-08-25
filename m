From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 03/13] arm/dt: Tegra: Add nvidia,
	enabled-gpios property to GPIO controller
Date: Thu, 25 Aug 2011 17:43:34 -0600
Message-ID: <1314315824-9687-4-git-send-email-swarren@nvidia.com>
References: <1314315824-9687-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1314315824-9687-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add board-specific gpio node for Harmony and Seaboard. This lists the
GPIOs used by the board. Note that not all GPIOs that exist on the board
are listed; only those used by devices currently supported by device
tree.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-harmony.dts  |   15 +++++++++++++++
 arch/arm/boot/dts/tegra-seaboard.dts |    8 ++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index e581866..2bbe559 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -15,6 +15,21 @@
 		reg = < 0x00000000 0x40000000 >;
 	};
 
+	gpio: gpio@6000d000 {
+		nvidia,enabled-gpios = <
+			69	// TEGRA_GPIO_PI5 SD2_CD
+			57	// TEGRA_GPIO_PH1 SD2_WP
+			155	// TEGRA_GPIO_PT3 SD2_POWER
+			58	// TEGRA_GPIO_PH2 SD4_CD
+			59	// TEGRA_GPIO_PH3 SD4_WP
+			70	// TEGRA_GPIO_PI6 SD4_POWER
+			187	// TEGRA_GPIO_PX3 CDC_IRQ
+			178	// TEGRA_GPIO_PW2 HP_DET
+			184	// TEGRA_GPIO_PX0 INT_MIC_EN
+			185	// TEGRA_GPIO_PX1 EXT_MIC_EN
+		>;
+	};
+
 	i2c@7000c000 {
 		clock-frequency = <400000>;
 
diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index 64cedca..ec8f8cf 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -16,6 +16,14 @@
 		reg = < 0x00000000 0x40000000 >;
 	};
 
+	gpio: gpio@6000d000 {
+		nvidia,enabled-gpios = <
+			69 // TEGRA_GPIO_PI5 SD2_CD
+			57 // TEGRA_GPIO_PH1 SD2_WP
+			70 // TEGRA_GPIO_PI6 SD2_POWER
+		>;
+	};
+
 	serial@70006300 {
 		clock-frequency = < 216000000 >;
 	};
-- 
1.7.0.4
