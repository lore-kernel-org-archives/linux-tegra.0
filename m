From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/2] ARM: dts: tegra: fix the PMC compatible string
Date: Wed, 27 Feb 2013 10:27:43 +0800
Message-ID: <1361932063-13263-2-git-send-email-josephl@nvidia.com>
References: <1361932063-13263-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361932063-13263-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The PMC HW is not 100% compatible across all Tegra series. We need to
specify them in DT.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* fix typo
---
 arch/arm/boot/dts/tegra114.dtsi | 2 +-
 arch/arm/boot/dts/tegra30.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 1dfaf28..e4ddedd 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -99,7 +99,7 @@
 	};
 
 	pmc {
-		compatible = "nvidia,tegra114-pmc", "nvidia,tegra30-pmc";
+		compatible = "nvidia,tegra114-pmc";
 		reg = <0x7000e400 0x400>;
 	};
 
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 767803e..6ae82e7 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -422,7 +422,7 @@
 	};
 
 	pmc {
-		compatible = "nvidia,tegra20-pmc", "nvidia,tegra30-pmc";
+		compatible = "nvidia,tegra30-pmc";
 		reg = <0x7000e400 0x400>;
 	};
 
-- 
1.8.1.1
