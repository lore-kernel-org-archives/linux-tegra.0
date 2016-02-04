From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] soc/sound: tegra_max98090: update dts affected by rename
Date: Wed,  3 Feb 2016 22:31:02 -0700
Message-ID: <1454563862-1971-5-git-send-email-sctincman@gmail.com>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454563862-1971-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Update the DTs that are affected by the DAPM headphone jack rename

Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi   | 4 ++--
 arch/arm/boot/dts/tegra124-venice2.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index ec1aa64..000b1f6 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -676,8 +676,8 @@
 
 	sound {
 		nvidia,audio-routing =
-			"Headphones", "HPR",
-			"Headphones", "HPL",
+			"Headphone Jack", "HPR",
+			"Headphone Jack", "HPL",
 			"Speakers", "SPKR",
 			"Speakers", "SPKL",
 			"Mic Jack", "MICBIAS",
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index cfbdf42..c535d55 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -1147,8 +1147,8 @@
 		nvidia,model = "NVIDIA Tegra Venice2";
 
 		nvidia,audio-routing =
-			"Headphones", "HPR",
-			"Headphones", "HPL",
+			"Headphone Jack", "HPR",
+			"Headphone Jack", "HPL",
 			"Speakers", "SPKR",
 			"Speakers", "SPKL",
 			"Mic Jack", "MICBIAS",
-- 
2.7.0
