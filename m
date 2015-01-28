From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v3 01/10] ARM: tegra: Set the sound card model that alsaucm
 expects
Date: Wed, 28 Jan 2015 11:50:59 +0100
Message-ID: <1422442278-10405-2-git-send-email-tomeu.vizoso@collabora.com>
References: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrew Bresticker <abrestic@chromium.org>, Simon Glass <sjg@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Patches are on its way to add a config file to alsaucm for the Nyan
boards. Use the same card ID that alsaucm will expect.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 004e8e4..eda6ae7 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -1108,9 +1108,9 @@
 	};
 
 	sound {
-		compatible = "nvidia,tegra-audio-max98090-nyan-big",
+		compatible = "nvidia,tegra-audio-max98090-nyan",
 			     "nvidia,tegra-audio-max98090";
-		nvidia,model = "Acer Chromebook 13";
+		nvidia,model = "GoogleNyan";
 
 		nvidia,audio-routing =
 			"Headphones", "HPR",
-- 
1.9.3
